function git_cred_store
    echo ""
    script_section_head "Configuration: Git Credential Store"
    echo ""
    if gum confirm "Create a Git Credential Store? This saves git credentials in plaintext on your disk!"
        if gum spin --title "Setting Git credential helper to store" --show-output -- git config --global credential.helper store
            gum log -sl info "Successfully set Git credential helper to store!"
        else
            gum log -sl error "Unable to set Git credential helper to store."
        end
    else
        gum log -sl warn "Not setting up Git credential helper"
    end
end
