require "socket"  
    
BasicSocket.do_not_reverse_lookup = true

server_socket = UDPSocket.new
server_socket.setsockopt(Socket::SOL_SOCKET,Socket::SO_BROADCAST,1)
server_socket.bind "", 2200


loop do  
 	 # Create a new thread for each connection.
  	reply, from = server_socket.recvfrom( 20, 0 )
 
	puts "received #{reply} from #{from[2]}:#{from[1]}"
	server_socket.send("Response Server: #{reply}", 0, from[2],from[1])
    
end  