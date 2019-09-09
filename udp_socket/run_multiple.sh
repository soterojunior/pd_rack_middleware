
#!/bin/bash
#
# Author: Sotero Junior <https://soterojunior.github.io/>
# 
# Executa Cliente/Servidor UDP passando a quantidade de Cliente 
# como parametro no bash script.
#
# Usage:   ./run_multiple.sh <TOTAL_CLIENT> 
# Example: bash ./run_multiple.sh 5

CLIENTS=(1 2 3 4 5)
TOTAL_CLIENT=$1
SERVER=./multiple_request/server_multiple.rb 
CLIENT_1=./multiple_request/client_1.rb
CLIENT_2=./multiple_request/client_2.rb
CLIENT_3=./multiple_request/client_3.rb
CLIENT_4=./multiple_request/client_4.rb
CLIENT_5=./multiple_request/client_5.rb

# Verifica se o numero total foi digitado correto
if [[ ! " ${CLIENTS[*]} " == *" $TOTAL_CLIENT "* ]]; then
    echo "Insert a Total Client or Total Client Incorrect"
    exit 1
fi

echo "Starting Server Handle multiple connections UDP..."
ruby $SERVER &

if [[ "${TOTAL_CLIENT}" == "1" ]]; then
    echo "Starting 01 client..."
	ruby $CLIENT_1 &
	wait $(jobs -p)
	echo "Finished."
    exit 1
fi

if [[ "${TOTAL_CLIENT}" == "2" ]]; then
    echo "Starting 02 client..."
    ruby $CLIENT_1 &
    ruby $CLIENT_2 &
	wait $(jobs -p)
	echo "Finished."
    exit 1
fi

if [[ "${TOTAL_CLIENT}" == "3" ]]; then
    echo "Starting 03 client..."
    ruby $CLIENT_1 &
    ruby $CLIENT_2 &
    ruby $CLIENT_3 &
	wait $(jobs -p)
	echo "Finished."
    exit 1
fi

if [[ "${TOTAL_CLIENT}" == "4" ]]; then
    echo "Starting 04 client..."
    ruby $CLIENT_1 &
    ruby $CLIENT_2 &
    ruby $CLIENT_3 &
    ruby $CLIENT_4 &
	wait $(jobs -p)
	echo "Finished."
    exit 1
fi

if [[ "${TOTAL_CLIENT}" == "5" ]]; then
    echo "Starting 05 client..."
    ruby $CLIENT_1 &
    ruby $CLIENT_2 &
    ruby $CLIENT_3 &
    ruby $CLIENT_4 &
    ruby $CLIENT_5 &
	wait $(jobs -p)
	echo "Finished."
    exit 1
fi



