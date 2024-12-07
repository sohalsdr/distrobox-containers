# Usage: create_dir [description] [path]

function create_dir
    echo ""
    script_section_head "Create Directory: $argv[1]"
    echo ""
    if gum confirm "Create the directory $argv[2]?"
        if gum spin --title "Creating $argv[2]" --show-output -- mkdir -p $argv[2]
            gum log -sl info "Successfully created $argv[1] at $argv[2]!"
        else
            gum log -sl error "Unable to create directory." path "$argv[2]" description "$argv[1]"
        end
    else
        gum log -sl warn "Not creating $argv[2]."
    end
end