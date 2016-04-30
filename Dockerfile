FROM alpine:latest

MAINTAINER JB Trystram <jib@trystram.net>


#Install what's needed
RUN apk update && \
    apk add git python-dev mercurial sqlite3 python-virtualenv && \
    ./bin/pip install pysqlite
    rm -rf /var/cache/apk/*

#Build firefox sync
RUN mkdir /ffsync && cd /ffsync \
    hg clone https://hg.mozilla.org/services/server-full && \
    cd ./server-full && make build

EXPOSE 80

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
