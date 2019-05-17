#!/bin/bash

cf curl /v3/route_mappings/$(echo "$(cf curl /v3/apps/$(cf app editor-v1 --guid)/route_mappings | jq .resources[1].guid)" | tr -d '"') -X PATCH -d '{"weight": 9}'