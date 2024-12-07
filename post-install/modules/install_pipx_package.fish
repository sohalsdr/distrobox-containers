# Usage: install_pipx_package [package]

function install_pipx_package
    echo ""
    script_section_head "Install Python App: $argv[1]"
    echo ""
    if gum confirm "Install $argv[1] using pipx?"
        if gum spin --title "Installing $argv[1]" --show-output -- pipx install $argv[1]
            gum log -sl info "Successfully installed $argv[1]!"
        else
            gum log -sl error "Unable to install package." package "$argv[1]"
        end
        if gum spin --title "Ensuring pipx packages are in PATH" --show-output -- pipx ensurepath
            gum log -sl info "Successfully ran pipx ensurepath!"
        else
            gum log -sl error "Error when running pipx ensurepath."
        end
    else
        gum log -sl warn "Not installing $argv[1]."
    end
end