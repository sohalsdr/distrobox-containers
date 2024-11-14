FROM alpine:3.20

# Add community repo
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/" >> /etc/apk/repositories
RUN apk update

# Install packages
RUN apk add fish fastfetch helix git github-cli starship screen python3 

# Install circup
RUN python3 -m pip install circup

# Copy configs into skel
WORKDIR /etc/skel/.config
COPY configs/ ./