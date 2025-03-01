FROM alpine:3.21

RUN apk add --no-cache bash curl \
    && curl -s https://install.zerotier.com | bash

RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
