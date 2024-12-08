function install_ame_aur
    echo ""
    script_section_head "Install AUR Helper: Amethyst"
    echo ""
    if gum confirm "Install the Amethyst AUR helper?"
        if gum spin --title "Downloading Amethyst PKGBUILD" --show-output -- git clone https://git.getcryst.al/crystal/pkgbuilds/ame /tmp/ame
            gum log -sl info "Successfully downloaded PKGBUILD to /tmp/ame!"
        else
            gum log -sl error "Unable to download PKGBUILD to /tmp/ame."
        end
        if gum spin --title "Installing Amethyst" --show-output -- cd /tmp/ame && makepkg -si
            gum log -sl info "Successfully installed Amethyst!"
        else
            gum log -sl error "Unable to install Amethyst."
        end
    else
        gum log -sl warn "Not installing Amethyst."
    end
end