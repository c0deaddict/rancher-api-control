#Rancher API control script Dockerfile
FROM alpine
MAINTAINER Ed Marshall (ed.marshall@infinityworks.com)

ENV CATTLE_ACCESS_KEY=na \
    CATTLE_SECRET_KEY=na \
    RANCHER_HOST=na \
    RUN=false

RUN apk --update add curl

COPY run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

CMD /usr/local/bin/run.sh
