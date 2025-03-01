ARG ALPINE_VERSION=3.21.3

FROM alpine:${ALPINE_VERSION}

ARG ZEROTIER_ONE_VERSION=1.14.2

LABEL maintainer="alterem <alterem520@gmail.com>"

RUN apk add --no-cache zerotier-one=${ZEROTIER_ONE_VERSION}

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
