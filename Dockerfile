#Rancher API control script Dockerfile
FROM alpine
MAINTAINER Ed Marshall (ed.marshall@infinityworks.com)

ENV RUN=false

RUN apk --update add curl

COPY confd/tmpl/* /etc/confd/templates/
COPY confd/toml/* /etc/confd/conf.d/
COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

RUN echo "http://dl-2.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories && \
    apk add --update go git gcc musl-dev && \
    git clone https://github.com/kelseyhightower/confd.git /src/confd && \
    cd /src/confd/src/github.com/kelseyhightower/confd/ && \
    GOPATH=/src/confd/vendor:/src/confd go build -a -installsuffix cgo -ldflags '-extld ld -extldflags -static' -x . && \
    mv ./confd /bin/ && \
    chmod +x /bin/confd && \
    apk del go git gcc musl-dev && \
    rm -rf /var/cache/apk/* /src

CMD /usr/local/bin/run.sh
