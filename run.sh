#!/bin/sh

if [ "$RUN" = true ] ; then 
    curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
    -X PUT \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{"activeValue":"", "id":"1as13", "name":"graphite.host", "source":"Database", "value":"'$RANCHER_HOST'"}' \
    ''$CATTLE_CONFIG_URL'/activesettings/1as13'
    echo "API Key updated"
else 
    echo "run mode set to false, not updating API"
fi
