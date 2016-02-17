#Rancher API control script Dockerfile
FROM alpine
MAINTAINER Ed Marshall (ed.marshall@infinityworks.com)

ENV RUN=false

RUN apk --update add curl

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD /usr/local/bin/run.sh
