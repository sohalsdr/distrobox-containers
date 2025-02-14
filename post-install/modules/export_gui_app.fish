# Usage: export_gui_app [app name]

function export_gui_app
    echo ""
    script_section_head "Export GUI App: $argv[1]"
    echo ""
    if gum confirm "Export $argv[1] to host?"
        if gum spin --title "Exporting $argv[1]" --show-output -- distrobox-export --app $argv[1]
            gum log -sl info "Successfully exported $argv[1]!"
        else
            gum log -sl error "Unable to export app." app "$argv[1]"
        end
    else
        gum log -sl warn "Not exporting $argv[1]."
    end
end