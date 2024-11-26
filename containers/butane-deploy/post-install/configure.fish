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

github_auth
git_config

set GIT_NAME (git config --global user.name)
if test -n "$GIT_NAME"
    create_directory "Git Working Directory" "$HOME/Git/$GIT_NAME"
end