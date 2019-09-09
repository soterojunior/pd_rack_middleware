require 'socket'
require 'csv'

p "Start Time Resquest: #{Process.clock_gettime(Process::CLOCK_MONOTONIC)}"

start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

CSV.open("result_tcp_single.csv","wb") do |csv|

	csv << ["client","time"] # header csv

	10000.times.each do |i|
		tcp = TCPSocket.new('localhost', 1024) # abro uma conexao
		tcp.puts "Hello" # envio para o servidor
		tcp.close_write  # fecha escrita para o servidor
		puts tcp.read    # leio a resposta do servidor e imprimo
		csv << ["Client 01",(Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time)] # add in csv response time
		tcp.close        # fecho conexao
	end

end
p "End Time Response: #{Process.clock_gettime(Process::CLOCK_MONOTONIC)}"

