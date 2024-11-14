# distrobox-containers
Starting points for Distrobox, with preconfiguration. Functionality is implemented in a way such that it integrates with Distrobox's customization steps (e.g. placing configs in /etc/skel rather than creating a user)

## generic-dev
All-purpose starting point for development. Arch system with basic environment installed and configured

### Post-install steps
- Run `sudo chsh -s /usr/bin/fish $USER` to change default shell to fish
- Set up GitHub authentication with GitHub CLI
- Set git username and email
- Potentially install an AUR helper

## circuitpython-dev
Slim, preconfigured environment based on Alpine with basic environment, plus python, pip, and circup for managing CircuitPython libraries

### Post-install steps
- Run `sudo chsh -s /usr/bin/fish $USER` to change default shell to fish
- Run `pipx ensurepath` to add pipx packages to PATH
- Set up GitHub authentication with GitHub CLI
- Set git username and email
- Install [CircuitPython Extension for VSCode](https://marketplace.visualstudio.com/items?itemName=joedevivo.vscode-circuitpython)
