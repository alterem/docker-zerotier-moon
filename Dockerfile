FROM debian:latest

RUN apt update && curl -s https://install.zerotier.com | bash

RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
