#!/bin/bash
#
# Author: Sotero Junior <https://soterojunior.github.io/>
# 
# Executa Cliente/Servidor UDP single connections with 10.000 requests.
#
# Usage:   ./run_single.sh 
# Example: bash ./run_single.sh 

SERVER=./single_request/server.rb
CLIENT=./single_request/client.rb

echo "Starting Server Single with a Client request..."

ruby $SERVER &

echo "Starting client..."

ruby $CLIENT &

kill -9 $CLIENT;
kill -9 $SERVER;

exit 1

echo "Finished."

wait $(jobs -p)

