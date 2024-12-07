# Set variables
set EDITOR hx

# Alias hx to helix if distro package doesn't alias it
if not command -v hx >/dev/null
    alias hx='helix'
end

starship init fish | source
