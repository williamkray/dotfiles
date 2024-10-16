#!/usr/bin/env bash
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias tmux="/usr/bin/tmux -2"
alias wow="git status"
alias hosts="sudo vim /etc/hosts"
alias xdg-open='XDG_CURRENT_DESKTOP="GNOME" /usr/bin/xdg-open'
alias irc="ssh -t home docker attach apps_weechat_1"
alias icat="kitty +kitten icat"
alias feh='myfeh.sh'
alias vim='nvim'
alias vimdiff='nvim -d'
alias wp="waypipe --video=hw -c lz4=7 ssh turbotuber"

## we dont necessarily want to do this automaticall
## as part of tmux.sh, in case we want to preserve bash history
## or we're working on something we want to come back to
## but this helps clean house a bit
prunetmux() {
  panes="$(tmux list-windows | grep bash | grep -v active | awk '{print $1}' | tr -d ':')"

  for i in $panes ; do
    tmux kill-window -t $i
  done
}

## functions to make using the bitwarden cli easier
## without having to remember everything
# unlock the vault
bwul() {
  tmp=$(mktemp)
  bw unlock --raw > $tmp
  export BW_SESSION=$(cat $tmp)
  rm $tmp
}

# search for items in the vault, and open it in a pager
# this prevents data leaking into tty history
bwsearch() {
  bw list items --search $@ --pretty | less
}

# get TOTP
bwotp() {
  bw get totp $1
}

# spit out a list of matches to search with uuid
# only include relevant identifiable content
bwid() {
  ids=$(bw list items --search $@ --pretty | grep '"id":' | awk -F '"' '{print $4}')
  for id in $ids ; do
    item=$(bw get item $id --pretty)
    un=$(echo "$item" | jq .login.username -r)
    name=$(echo "$item" | jq .name -r)
    echo -e "$id\t\t$name\t\t\t$un"
  done
}

## oft-referenced otps
alias otp-sso="bwul && bwotp b9d05657-72ea-455b-a4ec-ab3a004ddbc3 | xclip -i -selection clipboard"
