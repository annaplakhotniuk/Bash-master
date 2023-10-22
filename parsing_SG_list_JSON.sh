#!/bin/bash

input='[{"address":"https://st0.cloud.boosteroid.com:443","priority":false},{"address":"https://st1.cloud.boosteroid.com:443","priority":false},{"address":"https://md0.cloud.boosteroid.com:443","priority":true},{"address":"https://mr0.cloud.boosteroid.com:443","priority":true},{"address":"https://jv1.cloud.boosteroid.com:443","priority":false},{"address":"https://jv0.cloud.boosteroid.com:443","priority":false},{"address":"https://bg0.cloud.boosteroid.com:443","priority":true},{"address":"https://bg1.cloud.boosteroid.com:443","priority":true},{"address":"https://pl0.cloud.boosteroid.com:443","priority":true},{"address":"https://pl1.cloud.boosteroid.com:443","priority":true},{"address":"https://pl2.cloud.boosteroid.com:443","priority":true},{"address":"https://pl3.cloud.boosteroid.com:443","priority":true},{"address":"https://cl0.cloud.boosteroid.com:443","priority":false},{"address":"https://al0.cloud.boosteroid.com:443","priority":false},{"address":"https://ml0.cloud.boosteroid.com:443","priority":true},{"address":"https://ml1.cloud.boosteroid.com:443","priority":true},{"address":"https://cg0.cloud.boosteroid.com:443","priority":false},{"address":"https://cg1.cloud.boosteroid.com:443","priority":false},{"address":"https://kv1.cloud.boosteroid.com:443","priority":true},{"address":"https://kv0.cloud.boosteroid.com:443","priority":true},{"address":"https://pr0.cloud.boosteroid.com:443","priority":true},{"address":"https://pr1.cloud.boosteroid.com:443","priority":true},{"address":"https://br0.cloud.boosteroid.com:443","priority":true},{"address":"https://br1.cloud.boosteroid.com:443","priority":true},{"address":"https://br2.cloud.boosteroid.com:443","priority":true},{"address":"https://br3.cloud.boosteroid.com:443","priority":true},{"address":"https://nt1.cloud.boosteroid.com:443","priority":false},{"address":"https://nt0.cloud.boosteroid.com:443","priority":false},{"address":"https://ln1.cloud.boosteroid.com:443","priority":true},{"address":"https://ln0.cloud.boosteroid.com:443","priority":true},{"address":"https://sh0.cloud.boosteroid.com:443","priority":true},{"address":"https://sh1.cloud.boosteroid.com:443","priority":true}]'

var1=""
var2=""

for host in $(echo "$input" | jq -r '.[] | .address'); do
  priority=$(echo "$input" | jq -r --arg host "$host" '.[] | select(.address==$host) | .priority')
  if [ "$priority" = "true" ]; then
    var1=$host 
  else
    var2="$var2 $host"
  fi
done

echo "Variable 1: $var1"
echo "Variable 2: $var2"
