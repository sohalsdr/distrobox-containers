#!/usr/bin/env fish

# Find directory script is stored in
set SCRIPT_DIR (dirname (status --current-filename))

# Source helper functions
for helper in $SCRIPT_DIR/helpers/*.fish
    source $helper
end

#Source modules
for module in $SCRIPT_DIR/modules/*.fish
    source $module
end

script_head "> The Post-Install Script"

git_config
git_auth

install_yay_aur
install_determinate_nix