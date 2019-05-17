#!/bin/bash

./mvnw clean package
export CF_DOMAIN=`cf curl /v2/domains | jq .resources[0].entity.name | tr -d '"'`

# Deploy v1
cf push editor-v1 -p target/cf-routing-demo-0.0.1-SNAPSHOT.jar

# Deploy v2
cf push editor-v2 -p target/cf-routing-demo-0.0.1-SNAPSHOT.jar --no-start
cf set-env editor-v2 DEMO_LOGO vim
cf start editor-v2

# Route to v1 with a default weight of 1
cf map-route editor-v1 mesh.$CF_DOMAIN --hostname editor

# Route to v2 with a default weight of 1
cf map-route editor-v2 mesh.$CF_DOMAIN --hostname editor