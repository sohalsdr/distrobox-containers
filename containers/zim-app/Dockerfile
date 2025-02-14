FROM alpine:edge
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Install packages
RUN apk update
RUN apk add fish fastfetch helix git github-cli glab starship gum python3 py3-pip zim

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./

# Copy post install items into skel
WORKDIR /etc/skel/.post-install
COPY post-install.fish ./
COPY post-install/ ./

# Copy any scripts into skel
WORKDIR /etc/skel/.scripts
COPY scripts/ ./