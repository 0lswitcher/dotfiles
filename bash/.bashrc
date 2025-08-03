
# ░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░░░░
# ░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█░░▀░
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀░

# general commands
alias pls='sudo $(history -p !!)'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias lsa='ls -a'
alias lst='lsd --tree --depth'
alias tree='lsd --tree --depth'
alias cpa='cp -a'
alias cpd='cp -r'
alias cpr='cp -r'
alias cya='sudo rm'
alias cyall='sudo rm -R'
alias edit='micro'
alias who-owns='ls -l'
alias who-owns-d='ls -ld'
alias gimme='sudo chown -R 1000:100'
alias lemme='sudo chmod -R 644'
alias LEMME='sudo chmod -R 775'
alias purl='curl -v'
alias p='ping neocities.org'
alias m='micro'
alias q='exit'
alias c='exit'

# config editing
alias bashrc='micro ~/.bashrc'
alias codex='micro ~/stuff/notes/codex.txt'
alias ssh-conf='micro ~/.ssh/config'
alias nixos='micro /etc/nixos/configuration.nix'
alias nixos-conf='micro /etc/nixos/configuration.nix'
alias hypr-conf='micro ~/.config/hypr/hyprland.conf'
alias waybar-conf='micro ~/.config/waybar/config'
alias waybar-style='micro ~/.config/waybar/style.css'

# docker
alias docker-deploy='docker compose up -d'
alias docker-down='docker compose down'
alias docker-restart='docker compose down && docker compose up -d'
alias docker-reboot='sudo systemctl restart docker'

# directories
alias wad='cd /home/y2k/stuff/ && lsd'
alias ss='cd /home/y2k/stuff/pictures/screenshots/ && lsd'
alias stk='cd /home/y2k/stuff/docker/komodo/stacks/ && lsd'
alias stks='cd /home/y2k/stuff/docker/komodo/stacks/ && lsd'
alias stack='cd /home/y2k/stuff/docker/komodo/stacks/ && lsd'
alias stacks='cd /home/y2k/stuff/docker/komodo/stacks/ && lsd'
alias stacked='cd /home/y2k/stuff/docker/komodo/stacks/ && lsd'
alias linked='cd /home/y2k/stuff/sync/link/ && lsd'
alias mc-server='cd /home/y2k/stuff/other/ && lsd'
alias playit='cd /home/y2k/stuff/other/ && lsd'

# programs
alias vault='obsidian'
alias junts='ncspot'
alias juntui='com.spotify.Client &'
alias roblox='org.vinegarhq.Sober &'
alias calc='qalculate-qt'
alias neofetch='fastfetch'
alias astro='astroterm --color --constellations --speed 10000 --fps 64 --city Singapore'

# system management
alias gc='sudo nix-collect-garbage -d'
alias rebuild='sudo nixos-rebuild switch'
alias ciao='shutdown now'
alias ciaor='sudo reboot'

# other
alias smith='ssh smith'
alias neovault='ssh smith -L 42051:localhost:42051'
alias vaulttunnel='ssh smith -L 42051:localhost:42051'
alias waybar-reload='pkill waybar && hyprctl dispatch exec waybar'

# functions

# copy or move files and dirs to Syncthing link
send() {
  local mode="cp"
  local target="link"

  # parse options
  while getopts ":cmt:" opt; do
    case ${opt} in
      c) mode="cp" ;;  # default
      m) mode="mv" ;;
      t) target=$OPTARG ;;
      \?) echo "Invalid option: -$OPTARG" >&2; return 1 ;;
      :) echo "Option -$OPTARG requires an argument." >&2; return 1 ;;
    esac
  done
  shift $((OPTIND - 1))

  # check for file/dir input
  if [ $# -eq 0 ]; then
    echo "Usage: send [-c|-m] [-t target] <file-or-dir>..." >&2
    return 1
  fi

  # set destination paths
  case "$target" in
    syncthing) dest="/home/y2k/stuff/sync/link" ;;
    sync)      dest="/home/y2k/stuff/sync/link" ;;
    link)      dest="/home/y2k/stuff/sync/link" ;;  
    *) echo "Unknown target: $target" >&2; return 1 ;;
  esac

  # loop through each item
  for item in "$@"; do
    if [ ! -e "$item" ]; then
      echo "File not found: $item" >&2
      continue
    fi

    if [ "$mode" = "mv" ]; then
      read -p "Are you sure you want to move '$item' to '$target'? [y/N] " confirm
      if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo "Skipped: $item"
        continue
      fi
    fi

    $mode -v "$item" "$dest/"
    if [ $? -eq 0 ]; then
      echo "Successfully ${mode}ed '$item' to '$target' :)"
    else
      echo "Failed to ${mode} '$item' to '$target'" >&2
    fi
  done
}

# lcd a.k.a. cd /dir && lsd
lcd() {
  if [ -d "$1" ]; then
    cd "$1" && lsd
  else
    echo "lcd: '$1' is not a directory" >&2
    return 1
  fi
}


# ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀░░░░
# ░█░░░█░█░█░░░█░█░█▀▄░▀▀█░░▀░
# ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░

if [ -f "$HOME/.cache/current-pywal-theme" ]; then
    theme=$(<"$HOME/.cache/current-pywal-theme")
    wal -q --theme "$theme" || wal -q -i "$theme"
fi

# load last colorscheme from cache
# (cat ~/.cache/wal/sequences &)

# pywal TTY support (colors.tty doesnt exist atm)
# source ~/.cache/wal/colors.tty/sh

# ░█▀█░█▀▀░█▀▀░▀█▀░▀█▀░░░█▀█░█▀▄░▀█▀░░░░
# ░█▀█░▀▀█░█░░░░█░░░█░░░░█▀█░█▀▄░░█░░░▀░
# ░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░░▀░▀░▀░▀░░▀░░░▀░

read -r -d '' ART <<'EOF'
⁤⁣︇󠀡؜
                -=====-                         -=====-
                 _..._                           _..._
               .~     `~.        __           .~`     ~.
       ,_     /          }      / /\/\       {          \     _,
      ,_\'--, \   _.'`~~/       \_\  /        \~~`'._   / ,--'/_,
       \'--,_`{_,}    -(        /_/  \         )-    {,_}`_,--'/
        '.`-.`\;--,___.'_       \_\/\ \       _'.___,--;/`.-`.'
          '._`/    |_ _{@}         \_\/      {@}_ _|    \`_.'
             /     ` |-';/                   \;'-| `     \
            /   \    /  |                     |  \    /   \
           /     '--;_                           _;--'     \
          _\          `\                       /`          /_
         / |`-.___.    /                       \    .___,-'| \
 ^^^^^^^`--`------'`--`^^^^^^^^^^^^^^^^^^^^^^^^^`--`'------`--`^^^^^^^
EOF
echo "$ART"

export PATH=$PATH:/home/y2k/.spicetify

# format prompt
BLUE="\[\e[38;5;39m\]"
YELLOW="\[\e[38;5;214m\]"
RED="\[\e[38;5;196m\]"
RESET="\[\e[0m\]"

PS1=" ${BLUE} [\u@\h:${YELLOW}\w${BLUE}]\$ ${RESET}"
