# Authenticates Git, allowing user to choose whether to use github cli or just enable the credential store

function git_auth
    echo ""
    script_section_head "Configuration: Git Authentication"
    echo ""

    while true
        set GIT_AUTH_CHOICE $(gum choose --header "How should Git be authenticated?" --limit 1 "Github CLI" "Gitlab CLI" "Plaintext Git Credential Store" "No Authentication")
        if [ $GIT_AUTH_CHOICE = "Github CLI" ]
            git_auth_gh
            break
        else if [ $GIT_AUTH_CHOICE = "Gitlab CLI" ]
            git_auth_gl
            break
        else if [ $GIT_AUTH_CHOICE = "Plaintext Git Credential Store" ]
            git_auth_cred_store
            break
        else if [ $GIT_AUTH_CHOICE = "No Authentication" ]
            gum log -sl warn "Not setting up Git authentication"
            break
        end
        gum log -sl error "Invalid choice, please try again."
    end
end

function git_auth_gh
    if gh auth login -w -p https -h github.com
        gum log -sl info "Successfully set up Github authentication!"
    else
        gum log -sl error "Unable to set up Github authentication."
    end
end

function git_auth_gl
    if glab auth login
        gum log -sl info "Successfully set up Gitlab authentication!"
    else
        gum log -sl error "Unable to set up Gitlab authentication."
    end
end

function git_auth_cred_store
    if gum spin --title "Setting Git credential helper to store" --show-output -- git config --global credential.helper store
        gum log -sl info "Successfully set Git credential helper to store!"
    else
        gum log -sl error "Unable to set Git credential helper to store."
    end
end