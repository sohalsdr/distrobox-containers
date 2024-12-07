# distrobox-containers
Starting points for Distrobox, with preconfiguration. Functionality is implemented in a way such that it integrates with Distrobox's customization steps (e.g. placing configs in /etc/skel rather than creating a user)

## generic-dev
All-purpose starting point for development. Arch system with basic environment installed and configured.

### Post-install steps
- Run post install script with `post-install-script`
- Potentially install an AUR helper

## generic-dev-slim
Same idea as generic-dev, but based on Alpine Edge instead.

### Post-install steps
- Run post install script with `post-install-script`

## circuitpython-dev
Slim, preconfigured environment based on Alpine with basic environment, plus python, pip, and circup for managing CircuitPython libraries.

### Post-install steps
- Run post install script with `post-install-script`
- Install [CircuitPython Extension for VSCode](https://marketplace.visualstudio.com/items?itemName=joedevivo.vscode-circuitpython)

## butane-deploy
Similar to generic-dev-slim, but with butane and other utilities for working with and serving up Butane/Ignition configs

### Post-install steps
- Run post install script with `post-install-script`