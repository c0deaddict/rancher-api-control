#!/bin/bash

export CATTLE_ACCESS_KEY=na
export CATTLE_SECRET_KEY=na
export RANCHER_HOST=na
export RUN=false

if [ "$RUN" = true ] ; then 
    curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
    -X PUT \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{"activeValue":"", "id":"1as13", "name":"graphite.host", "source":"Database", "value":"'$RANCHER_HOST'"}' \
    'http://'$RANCHER_HOST':8080/v1/activesettings/1as13'
    echo "API Key updated"
else 
    echo "run mode set to false, not updating API"
fi
