FROM alpine:latest

MAINTAINER JB Trystram <jib@trystram.net>


#Install what's needed
RUN apk update && \
    apk add git python python-dev py-pip g++ sqlite build-base && \
    pip install virtualenv && \
    rm -rf /var/cache/apk/*

#Build firefox sync
RUN git clone https://github.com/mozilla-services/syncserver && \
    cd /syncserver && make build

EXPOSE 80

VOLUME ["/data"]

ADD entry.sh /entry.sh
RUN chmod +x /entry.sh 

ENTRYPOINT ["/entry.sh"]
