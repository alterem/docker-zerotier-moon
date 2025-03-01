FROM alpine:3.21

RUN curl -sL https://packagecloud.io/install/repositories/zerotier/zerotier/script.deb.sh | bash |
    && apk update && apk add zerotier-one


RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
