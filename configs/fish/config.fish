# Set variables


# Alias hx to helix if distro package doesn't alias it
if not command -v hx >/dev/null
    alias hx='helix'
end

# Autorun post install script on first launch
if test -e $HOME/.post-install/post-install.fish and not test -e $HOME/.post-install-autorun
    fish $HOME/.post-install/post-install.fish
    touch $HOME/.post-install-autorun
end

starship init fish | source
