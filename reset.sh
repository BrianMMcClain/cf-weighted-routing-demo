#!/bin/bash

cf delete editor-v1 -f
cf delete editor-v2 -f
cf delete-route $CF_DOMAIN --hostname editor-v1 -f
cf delete-route $CF_DOMAIN --hostname editor-v2 -f
cf delete-route mesh.$CF_DOMAIN --hostname editor -f
