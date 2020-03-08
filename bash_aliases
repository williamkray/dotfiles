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
