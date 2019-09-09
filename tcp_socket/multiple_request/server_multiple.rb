require "socket"  
    
echo_server = TCPServer.new('localhost', 2200)  

loop do  
  # Create a new thread for each connection.
  t1 = Thread.start(echo_server.accept) do |client|  
    puts "#{client.peeraddr[2]}:#{client.peeraddr[1]} is connected"

    data = client.gets
    client.puts "You requested: #{data}"
       
    client.close
    Thread.exit
  end  
  Thread.kill(t1)
end  