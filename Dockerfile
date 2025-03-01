FROM debian:latest

RUN apt update && apt install -y curl && curl -s https://install.zerotier.com | bash && zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
