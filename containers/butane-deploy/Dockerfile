FROM fedora:latest
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Add copr for starship prompt
RUN dnf copr --assumeyes enable atim/starship 

# Install packages
RUN dnf install --assumeyes fish fastfetch helix git gh starship python3 python3-pip make envsubst butane coreos-installer

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./

# Copy post install items into skel
WORKDIR /etc/skel/.post_install
COPY post-install/ ./
