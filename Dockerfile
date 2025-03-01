FROM alpine:latest

RUN apk update && apk add --no-cache curl bash

RUN curl -s https://install.zerotier.com | bash && apk update && apk add zerotier-one

RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
