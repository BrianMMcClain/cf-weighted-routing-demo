#!/bin/bash

EMACS_WEIGHT=`cf curl /v3/route_mappings/$(echo "$(cf curl /v3/apps/$(cf app editor-v1 --guid)/route_mappings | jq .resources[1].guid)" | tr -d '"') | jq .weight`
VIM_WEIGHT=`cf curl /v3/route_mappings/$(echo "$(cf curl /v3/apps/$(cf app editor-v2 --guid)/route_mappings | jq .resources[1].guid)" | tr -d '"') | jq .weight`

echo "Emacs Weight: $EMACS_WEIGHT"
echo "Vim Weight: $VIM_WEIGHT"