#!/bin/bash

CF_DOMAIN=`cf curl /v2/domains | jq .resources[0].entity.name | tr -d '"'`

EMACS_HITS=`curl -s editor-v1.$CF_DOMAIN/hits`
VIM_HITS=`curl -s editor-v2.$CF_DOMAIN/hits`

echo "Emacs: $EMACS_HITS"
echo "Vim: $VIM_HITS"