FROM alpine:3.20
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Add community repo
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/" >> /etc/apk/repositories
RUN apk update

# Install packages
RUN apk add fish fastfetch helix git github-cli starship gum screen python3 py3-pip pipx

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./

# Copy post install items into skel
WORKDIR /etc/skel/.post_install
COPY post-install.fish ./
COPY post-install/ ./

# Copy any scripts into skel
WORKDIR /etc/skel/.scripts
COPY scripts/ ./