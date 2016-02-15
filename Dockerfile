#Rancher API control script Dockerfile
FROM alpine
MAINTAINER Ed Marshall (ed.marshall@infinityworks.com)

ENV $CATTLE_ACCESS_KEY=na \
    $CATTLE_SECRET_KEY=na \
    $RANCHER_HOST=na

CMD curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
  -X PUT \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{"activeValue":"", "id":"1as13", "name":"graphite.host", "source":"Database", "value":"$RANCHER_HOST"}' \
  'http://$RANCHER_HOST:8080/v1/activesettings/1as13'
