# Usage: error_print [error] [command_to_retry]

function error_print
    color_print $COLOR_R "$argv[1]"
    color_print $COLOR_Y "\t$argv[2]"
end