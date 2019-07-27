#!/usr/bin/env bash
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias home="ssh -C kray"
alias vpn="/home/william/.scripts/vpn.sh"
alias tmux="/usr/bin/tmux -2"
alias wow="git status"
alias hosts="sudo vim /etc/hosts"
alias notes="vim ~/Notes/00_quick.txt"
alias slock="slock -c \"#8c9440\" -d"
alias stagent="eval \"$(ssh-agent -s)\""
alias xdg-open='XDG_CURRENT_DESKTOP="GNOME" /usr/bin/xdg-open'
alias bbstagent="eval \"$(ssh-agent -s)\" && ssh-add ~/Work/projects/beachbody/keys/*"
alias netrestart="sudo systemctl restart netctl-auto@wlp3s0"
