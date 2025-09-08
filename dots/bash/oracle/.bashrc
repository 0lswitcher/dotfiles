# combine .bashrc_shared from GitHub repo and .bashrc_local from LFS

CACHE="$HOME/.cache/bashrc_shared"
URL="https://raw.githubusercontent.com/0lswitcher/dotfiles/refs/heads/main/dots/bash/.bashrc_shared"

# refresh once per day
if [ ! -f "$CACHE" ] || [ $(date +%s -r "$CACHE") -lt $(( $(date +%s) - 86400 )) ]; then
  curl -fsSL "$URL" -o "$CACHE"
fi

source "$CACHE"
[ -f ~/.bashrc_local ] && source ~/.bashrc_local

# only one alias, all other are kept in .bashrc_local and .bashrc_shared
alias bashrc-pull='curl -fsSL "$URL" -o "$CACHE" && echo "pulled latest .bashrc_shared from repo"'
alias bashrc-update='curl -fsSL "$URL" -o "$CACHE" && echo "pulled latest .bashrc_shared from repo"'
alias bashrc-peek='cat "$CACHE"'
