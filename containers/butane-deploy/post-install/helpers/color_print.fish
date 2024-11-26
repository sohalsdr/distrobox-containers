# USAGE: `printf "%b" "$COLOR_B\e0This is a blue text.$COLOR_RESET"`
# printf "%b" "$BG_R\e0This is text with a red background.$COLOR_RESET"
set -U COLOR_RESET "\033[0m"

set -U COLOR_K "\033[0;30m"    # black
set -U COLOR_R "\033[0;31m"    # red
set -U COLOR_G "\033[0;32m"    # green
set -U COLOR_Y "\033[0;33m"    # yellow
set -U COLOR_B "\033[0;34m"    # blue
set -U COLOR_M "\033[0;35m"    # magenta
set -U COLOR_C "\033[0;36m"    # cyan
set -U COLOR_W "\033[0;37m"    # white

# empahsized (bolded) colors
set -U EM_K "\033[1;30m"
set -U EM_R "\033[1;31m"
set -U EM_G "\033[1;32m"
set -U EM_Y "\033[1;33m"
set -U EM_B "\033[1;34m"
set -U EM_M "\033[1;35m"
set -U EM_C "\033[1;36m"
set -U EM_W "\033[1;37m"

# background colors
set -U BG_K "\033[40m"
set -U BG_R "\033[41m"
set -U BG_G "\033[42m"
set -U BG_Y "\033[43m"
set -U BG_B "\033[44m"
set -U BG_M "\033[45m"
set -U BG_C "\033[46m"
set -U BG_W "\033[47m"

# usage: color_print $COLOR_R "I am red"
# multiline: color_print $COLOR_R "I am red\n"; color_print $COLOR_B "I am blue"
function color_print
  printf "%b" "$argv[1]\e0$argv[2]$COLOR_RESET\n"
end