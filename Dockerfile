FROM alpine:3.21

# Install necessary packages
RUN apk add --no-cache curl

# Download and install ZeroTier
RUN curl -s https://install.zerotier.com | bash

# Verify installation
RUN zerotier-cli info

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
