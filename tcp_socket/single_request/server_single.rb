require 'socket'

def handle_session(socket)
  s = socket.gets
  socket.puts "You requested: #{s}" #print the request client
  socket.write("Response: " + Time.now.strftime("%d/%m/%Y - %H:%M:%S(%L)")) #write time response server
  #socket.puts(Time.now.strftime "%H:%M:%S(%L)")
  socket.close
end

server = TCPServer.new('localhost', 1024)
while (session = server.accept)
  Thread.new do
    handle_session(session)
  end
end