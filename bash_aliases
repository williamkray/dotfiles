#!/usr/bin/env bash
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias home="ssh -X -C -D 8118 -L 5901:localhost:5901 -L 5902:localhost:5900 -L 3389:localhost:3389 kray"
alias vpn="/home/william/.scripts/vpn.sh"
alias tmux="/usr/bin/tmux -2"
alias tf="/home/william/Build/tee-clc/TEE-CLC-11.0.0/tf"
alias wow="git status"
alias much="git"
alias very="git"
alias such="git"
alias hosts="sudo vim /etc/hosts"
alias notes="vim ~/Notes/00_quick.txt"
alias slock="slock -c \"#8c9440\" -d"
alias stagent="eval \"$(ssh-agent -s)\""
alias xdg-open='XDG_CURRENT_DESKTOP="GNOME" /usr/bin/xdg-open'
alias tavpn="sudo openconnect gp.taxact.com --servercert sha256:6674c13bff3e640d59a697ed6b9a545efe73488a7673447da9a9a18ec1358a34 --protocol=gp -u ext_wkray"
alias bbstagent="eval \"$(ssh-agent -s)\" && ssh-add ~/Work/projects/beachbody/keys/*"
alias bbokta="otp.sh $bb && ~/Work/projects/beachbody/Okta/get-aws-keys.py -p digiprod"
alias bbjenkins="bbstagent && ssh ip-10-200-0-46"
alias bbvpn="~/Work/projects/beachbody/bbstartvpn.exp"
alias gitconfci="git config user.name 'William Kray' && git config user.email wkray@corpinfo.com"
alias gitconfwk="git config user.name 'William Kray' && git config user.email william@kray.pw"

