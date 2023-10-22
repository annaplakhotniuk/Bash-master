#!/bin/bash

echo "Block all Demo SG...with values 'TRUE'"

hostnames=${1}
# Use the IP address in another command
for hostname in "${hostnames[@]}"
do
    sudo iptables -I INPUT -p tcp -j DROP -s $ip
    echo "The IP address for $hostname is $ip"
        
   
done
echo "-----------------------------------------------------------"
echo "               ALL SG is Blocked!!!!!!!!!!"
sudo iptables -n -L -v
echo "----------------------------------------------------------------------------------"
echo " List of ALL SG which are Blocked!!!!!!!!!!"

