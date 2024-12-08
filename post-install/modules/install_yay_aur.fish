function install_yay_aur
    echo ""
    script_section_head "Install AUR Helper: yay"
    echo ""
    if gum confirm "Install the yay AUR helper?"
        if gum spin --title "Downloading yay PKGBUILD" --show-output -- git clone https://aur.archlinux.org/yay.git /tmp/yay
            gum log -sl info "Successfully downloaded PKGBUILD to /tmp/yay!"
        else
            gum log -sl error "Unable to download PKGBUILD to /tmp/yay."
        end
        if gum spin --title "Installing yay" --show-output -- cd /tmp/yay && makepkg -si
            gum log -sl info "Successfully installed yay!"
        else
            gum log -sl error "Unable to install yay."
        end
    else
        gum log -sl warn "Not installing yay."
    end
end