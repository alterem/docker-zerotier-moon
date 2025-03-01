FROM alpine:latest

RUN apk update && apk add --no-cache curl bash

# Separate the commands to identify the failure point
RUN curl -s https://install.zerotier.com -o install-zerotier.sh && \
    chmod +x install-zerotier.sh && \
    ./install-zerotier.sh

RUN apk update && apk add zerotier-one

RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
