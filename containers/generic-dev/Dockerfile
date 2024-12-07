FROM archlinux:latest
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Install packages
RUN pacman -Sy --noconfirm fish fastfetch helix git github-cli starship base-devel mesa python

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