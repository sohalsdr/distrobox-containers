FROM fedora:latest
LABEL org.opencontainers.image.source https://github.com/sohalsdr/distrobox-containers

# Add copr for starship prompt
RUN dnf copr --assumeyes enable atim/starship 

# Add repo for gum
WORKDIR /etc/yum.repos.d
COPY charm.repo ./
RUN rpm --import https://repo.charm.sh/yum/gpg.key

# Install packages
RUN dnf install --assumeyes fish fastfetch helix git gh starship gum python3 python3-pip make envsubst mkpasswd butane coreos-installer

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY ../../configs/ ./

# Copy post install items into skel
WORKDIR /etc/skel/.post_install
COPY post-install.fish ./
COPY ../../post-install/ ./

# Copy any scripts into skel
WORKDIR /etc/skel/.scripts
COPY ../../scripts/ ./
