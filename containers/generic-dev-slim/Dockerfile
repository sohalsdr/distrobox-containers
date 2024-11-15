FROM alpine:edge
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Add testing repo (community repo is already enabled)
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk update

# Install packages
RUN apk add fish fastfetch helix git github-cli starship python3 py3-pip

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./