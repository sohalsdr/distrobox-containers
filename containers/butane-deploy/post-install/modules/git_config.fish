#!/usr/bin/env fish

function git_config
    info_print "\nPost-Install: Configure Git name and email"
    if read_confirm
        info_print "Configuring Git name..."
        echo "What would you like to set your Git name to?"
        read -l -P 'Git name: ' GIT_NAME
        command_print "git config --global user.name $GIT_NAME"
        if git config --global user.name $GIT_NAME
            success_print "Successfully set Git name to $GIT_NAME!"
        else
            error_print "Seems like there was a problem. We'll continue for now, and this can be attempted later by re-running the following command:" "git config --global user.name $GIT_NAME"
        end

        info_print "\nConfiguring Git email..."
        echo "What would you like to set your Git email to?"
        read -l -P 'Git email: ' GIT_EMAIL
        command_print "git config --global user.name $GIT_EMAIL"
        if git config --global user.name $GIT_EMAIL
            success_print "Successfully set Git name to $GIT_EMAIL!"
        else
            error_print "Seems like there was a problem. We'll continue for now, and this can be attempted later by re-running the following command:" "git config --global user.email $GIT_EMAIL"
        end
    else
        info_print "Not configuring Git name and email."
    end
end