function git_config
    echo ""
    script_section_head "Configuration: Git Name and Email"
    echo ""
    if gum confirm "Set Git name and email?"
        while true
            set GIT_NAME $(gum input --prompt "Enter your Git username: " --placeholder "username")
            set GIT_EMAIL $(gum input --prompt "Enter your Git email: " --placeholder "username@email.com")

            if gum confirm "Your Git name will be $GIT_NAME and your Git email will be $GIT_EMAIL. Does this sound good?"
                break
            end
        end

        if gum spin --title "Setting Git name and email" --show-output -- git config --global user.name $GIT_NAME; and git config --global user.email $GIT_EMAIL
            gum log -sl info "Successfully set Git name and email!"
        else
            gum log -sl error "Unable to set Git name and/or email." name "$GIT_NAME" email "$GIT_EMAIL"
        end
    else
        gum log -sl warn "Not setting Git name and email"
    end
end
