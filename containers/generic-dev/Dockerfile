FROM archlinux:latest
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Install packages
RUN pacman -Sy --noconfirm fish fastfetch helix git github-cli starship base-devel mesa python

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./