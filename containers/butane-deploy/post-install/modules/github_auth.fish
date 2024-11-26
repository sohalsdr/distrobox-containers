#!/usr/bin/env fish

function github_auth
    info_print "\nPost-Install: Configure Github authentication"
    if read_confirm
        info_print "Launching Github authentication flow..."
        command_print "gh auth login"
        if gh auth login
            success_print "Successfully authenticated with Github!"
        else
            error_print "Seems like there was a problem. We'll continue for now, and this can be attempted later by re-running the following command:" "gh auth login"
        end
    else
        info_print "Not configuring Github authentication."
    end
end