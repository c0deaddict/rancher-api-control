#!/bin/sh

CATTLE_CONFIG_IP=$(echo $CATTLE_CONFIG_URL | grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}")


if [ "$RUN" = true ] ; then 
    curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
    -X PUT \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d '{"activeValue":"", "id":"1as13", "name":"graphite.host", "source":"Database", "value":'${CATTLE_CONFIG_IP}'}' \
    '${CATTLE_CONFIG_URL}/activesettings/1as13'
    echo "API Key updated"
else 
    echo "run mode set to false, not updating API"
fi
