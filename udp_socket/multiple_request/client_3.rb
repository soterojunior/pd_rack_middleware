
require 'socket'
require 'csv'

p "Start Time Resquest: #{Process.clock_gettime(Process::CLOCK_MONOTONIC)}"

start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

CSV.open("result_udp_multiple_3_client.csv","wb") do |csv|

	csv << ["client","time"] # header csv

	10000.times.each do |i|
		client_socket = UDPSocket.new
	    client_socket.connect("", 2200)
	    client_socket.puts "Hello"
	    reply, from = client_socket.recvfrom(20, 0)
	    puts reply
	    csv << ["Client 03",(Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time)]
	    client_socket.close
	end

end
p "End Time Response: #{Process.clock_gettime(Process::CLOCK_MONOTONIC)}"


   