
[ -f "/c/ghcup/env" ] && source "/c/ghcup/env" # ghcup-env
/c/Windows/System32/chcp.com 65001 > /dev/null 2>&1
if [ -t 1 ]; then
    exec zsh
fi