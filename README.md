# distrobox-containers
Starting points for Distrobox, with preconfiguration. Functionality is implemented in a way such that it integrates with Distrobox's customization steps (e.g. placing configs in /etc/skel rather than creating a user)

## Usage

### With Distrobox

To use one of these, just create a Distrobox using [`distrobox-create`](https://distrobox.it/usage/distrobox-create/), specifying one of the images in this repo as the image to use (make sure to use the full URI, e.g. `ghcr.io/sohalsdr/distrobox-containers-generic-dev`)

I personally recommend also using a different home directory rather than using your host's home directory, especially since these images contain things that are copied into the home directory, and parts of the post-install script will modify things in the home directory.

### With WSL

Note: This hasn't been tested much

These containers should be importable in WSL through the method outlined [here](https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro#add-wsl-specific-components-like-a-default-user). This repository's CI exports each container as a `.tar` archive, and the artifacts can be downloaded by going into the latest workflow run in the Actions tab.

Alternatively, they can be downloaded via [nightly.link](https://nightly.link) at the following page:

[Download artifacts here](https://nightly.link/sohalsdr/distrobox-containers/workflows/container-ci/main?preview)

After downloading the tarfile, you'll likely need to:
- Create a user
- Ensure they have desired groups and permissions (such as the ability to sudo)
- Set a password for the user
- Run `echo -e "[user]\ndefault=USERNAME" >> /etc/wsl.conf` to make that the default user when the container is launched ()
- Edit your Windows Terminal entry (or other method of launching WSL) to run WSL and immediately run `fish` so that you're not being launched into bash every time

## Containers

### generic-dev
All-purpose starting point for development. Arch system with basic environment installed and configured.

#### Post-install steps
- Run post install script with `post-install-script`

### generic-dev-slim
Same idea as generic-dev, but based on Alpine Edge instead.

#### Post-install steps
- Run post install script with `post-install-script`

### circuitpython-dev
Slim, preconfigured environment based on Alpine with basic environment, plus python, pip, and circup for managing CircuitPython libraries.

#### Post-install steps
- Run post install script with `post-install-script`
- Install [CircuitPython Extension for VSCode](https://marketplace.visualstudio.com/items?itemName=joedevivo.vscode-circuitpython)

### butane-deploy
Similar to generic-dev-slim, but with butane and other utilities for working with and serving up Butane/Ignition configs

#### Post-install steps
- Run post install script with `post-install-script`