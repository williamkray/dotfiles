# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.scripts/git-prompt.sh
. ~/.scripts/git-completion.bash
. ~/.secret/2fa/secrets
. ~/.scripts/pass.bash-completion

export PASSWORD_STORE_GENERATED_LENGTH=16
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR=$HOME/Projects/password-store-extensions

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PROMPT_COMMAND="__git_ps1 \[\"\u@\h \w\"]\\\n\$'\u21B3' \ \\\$\ "
PROMPT_COMMAND="__git_ps1 \[\\\W\] \ $'\u25B6'\ "

export PATH=$PATH:/home/william/.scripts:/home/william/.gem/ruby/2.1.0/bin:/opt/android-sdk/platform-tools:/home/william/.gem/ruby/2.2.0/bin
#export TERM=xterm-256color
alias home="ssh -X -C -L 5901:localhost:5901 -L 5902:localhost:5900 -L 3389:localhost:3389 kray"
alias vpn="/home/william/.scripts/vpn.sh"
alias tmux="/usr/bin/tmux -2"
alias wow="git status"
alias much="git"
alias very="git"
alias such="git"
alias hosts="sudo vim /etc/hosts"
#alias pacaur="pacaur --domain aur4.archlinux.org"
alias notes="vim ~/Notes/00_quick.txt"
alias time="vim ~/CorpInfo/time/$(date +%Y%m%d).txt"
alias slock="slock -c \"#8c9440\" -d"
alias stagent="eval \"$(ssh-agent -s)\""
alias xdg-open='XDG_CURRENT_DESKTOP="GNOME" /usr/bin/xdg-open'
alias bbstagent="eval \"$(ssh-agent -s)\" && ssh-add ~/Work/projects/beachbody/keys/*"
alias bbokta="otp.sh $bb && ~/Work/projects/beachbody/Okta/get-aws-keys.py -p digiprod"
alias bbjenkins="bbstagent && ssh ip-10-200-0-46"
alias bbvpn="~/Work/projects/beachbody/bbstartvpn.exp"
alias syncpass="pass git pull && pass git push"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xdefaults | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

