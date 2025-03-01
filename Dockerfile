FROM alpine:3.21

RUN apk add --no-cache curl \
    && curl -s https://install.zerotier.com | sh

RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
