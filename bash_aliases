#!/usr/bin/env bash
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias home="ssh -C kray"
alias tmux="/usr/bin/tmux -2"
alias wow="git status"
alias hosts="sudo vim /etc/hosts"
alias xdg-open='XDG_CURRENT_DESKTOP="GNOME" /usr/bin/xdg-open'
alias netrestart="sudo systemctl restart netctl-auto@wlp4s0"
alias irc="ssh -t kray docker attach apps_weechat_1"

## functions to make using the bitwarden cli easier
## without having to remember everything
# unlock the vault
bwul() {
  export BW_SESSION=${BW_SESSION:-$(bw unlock --raw)}
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

## tmuxify cmus
run-cmus() {
  if [ ! $TMUX ] ; then
    echo "not running in tmux, try again"
  else
    if ! pidof cmus ; then
      tmux_cmd="tmux new-window -n CMus 'cd ~/Music/playlists ; cmus'"
    else
      tmux_cmd='tmux select-window -t CMus'
    fi
      eval $tmux_cmd & \
      sleep 1 && \
      cmus-remote -l ~/Music/contemporary && \
      cmus-remote -C update-cache
  fi
}
alias cmus="run-cmus"

## tmuxify cmus
run-mutt() {
  if [ ! $TMUX ] ; then
    echo "not running in tmux, try again"
  else
    if ! pidof mutt ; then
      mutt_cmd="tmux new-window -n mutt 'export BW_SESSION=${BW_SESSION:-$(bw unlock --raw)} ; mutt'"
    else
      mutt_cmd='tmux select-window -t mutt'
    fi
      eval $mutt_cmd &
  fi
}
alias mutt="run-mutt"
