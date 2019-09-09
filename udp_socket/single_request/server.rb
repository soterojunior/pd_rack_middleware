# encoding: utf-8

require 'socket'

server_socket = UDPSocket.new
server_socket.bind "", 2200

loop do 
	reply, from = server_socket.recvfrom( 20, 0 )
	p reply
	p from
	puts "received #{reply} from #{from[2]}:#{from[1]}"
	server_socket.send("Response Server: #{reply}", 0, from[2],from[1])
	#server_socket.close
end