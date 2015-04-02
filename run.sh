server_ip=10.1.1.248
client_ip=10.1.1.247
server_port=5558
server_cmd="julia /home/wdai/julia/net_test/server.jl $server_port"
client_cmd="julia /home/wdai/julia/net_test/client.jl $server_ip $server_port"

ssh_options="-oStrictHostKeyChecking=no \
-oUserKnownHostsFile=/dev/null \
-oLogLevel=quiet"

echo "Killing julia processes..."
ssh $ssh_options $server_ip killall -q julia
ssh $ssh_options $client_ip killall -q julia
echo "Done killing julia"


echo "Starting server..."
#echo $server_cmd
ssh $ssh_options $server_ip $server_cmd&
sleep 5
echo "Starting client..."
#echo $client_cmd
ssh $ssh_options $client_ip $client_cmd&
