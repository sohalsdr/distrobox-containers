FROM alpine:edge
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Add community and testing repos
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/" >> /etc/apk/repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/testing/" >> /etc/apk/repositories
RUN apk update

# Install packages
RUN apk add fish fastfetch helix git github-cli starship python3 py3-pip

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./