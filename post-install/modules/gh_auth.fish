function gh_auth
    echo ""
    script_section_head "Configuration: Github CLI Authentication"
    echo ""
    if gum confirm "Authenticate to Github using the Github CLI?"
        if gum spin --title "Starting authentication using Github CLI" --show-output -- gh auth login
            gum log -sl info "Successfully set up Github authentication!"
        else
            gum log -sl error "Unable to set up Github authentication."
        end
    else
        gum log -sl warn "Not authenticating to Github using the Github CLI"
    end
end