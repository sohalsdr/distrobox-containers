# Set variables
set EDITOR hx

# Alias hx to helix if distro package doesn't alias it
if not command -v hx >/dev/null
    alias hx='helix'
end

# Create alias for post install script
alias post-install-script='fish $HOME/.post-install/post-install.fish'

starship init fish | source
