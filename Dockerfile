FROM alpine:3.21

# Specify the version of ZeroTier One
ENV ZEROTIER_ONE_VERSION=1.14.2

# Update package repositories and install ZeroTier One
RUN apk update && apk add --no-cache zerotier-one=${ZEROTIER_ONE_VERSION} || \
    (echo "Package not found, trying a different version" && apk add --no-cache zerotier-one)

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
