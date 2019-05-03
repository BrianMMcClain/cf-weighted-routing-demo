#!/bin/bash

# Query the domain from CF
CF_DOMAIN=`cf curl /v2/domains | jq .resources[0].entity.name | tr -d '"'`

# Default to 100 requests if no argument is provided
COUNT=${1:-100} 

echo "Request Count: $COUNT"
while [ $COUNT -gt 0 ]
do
    curl https://editor.mesh.$CF_DOMAIN -k 2> /dev/null | grep img | sed -e 's/.*img\/\(.*\.png\).*/\1/'
    let COUNT=COUNT-1
done