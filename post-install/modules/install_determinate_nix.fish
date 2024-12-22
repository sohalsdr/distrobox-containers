function install_determinate_nix
    echo ""
    script_section_head "Install Package Manager: Determinate Nix"
    echo ""
    if gum confirm "Install the Nix Package Manager using the Determinate Nix Installer?"
        if gum spin --title "Installing Nix" --show-output -- curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate --init none
            gum log -sl info "Successfully installed yay!"
        else
            gum log -sl error "Unable to install Nix."
        end
    else
        gum log -sl warn "Not installing Nix."
    end
end