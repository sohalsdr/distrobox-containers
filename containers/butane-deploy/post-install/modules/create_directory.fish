#!/usr/bin/env fish

# Usage: create_directory [description] [path]

function create_directory
    info_print "\nCreate Directory: $argv[1]"
    if read_confirm
        info_print "\nCreating $argv[1]..."
        command_print "mkdir -p $argv[2]"
        if mkdir -p $argv[2]
            success_print "Successfully created $argv[1]!"
        else
            error_print "Seems like there was a problem. We'll continue for now, and this can be attempted later by re-running the following command:" "mkdir -p $argv[2]"
        end
    else
        info_print "Not creating $argv[1]."
    end
end