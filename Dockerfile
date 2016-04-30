FROM alpine:latest

MAINTAINER JB Trystram <jib@trystram.net>


#Install what's needed
RUN apk update && \
    apk add git python-dev g++ sqlite3 python-virtualenv && \
    ./bin/pip install pysqlite
    rm -rf /var/cache/apk/*

#Build firefox sync
RUN mkdir /ffsync && cd /ffsync \
    git clone https://github.com/mozilla-services/syncserver
    cd ./server-full && make build

EXPOSE 80

VOLUME ["/data"]

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
