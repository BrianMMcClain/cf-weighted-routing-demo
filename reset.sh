#!/bin/bash

echo "Resetting counters . . ."

export CF_DOMAIN=`cf curl /v2/domains | jq .resources[0].entity.name | tr -d '"'`

curl -s editor-v1.$CF_DOMAIN/reset > /dev/null
curl -s editor-v2.$CF_DOMAIN/reset > /dev/null
echo "Done!"