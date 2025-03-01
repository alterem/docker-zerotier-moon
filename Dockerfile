FROM alpine:latest

RUN apk update && apk add --no-cache curl bash

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/v$(cut -d '.' -f 1,2 /etc/alpine-release)/community" >> /etc/apk/repositories
RUN apk update && apk add zerotier-one

RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
