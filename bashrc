# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/Scripts/git-prompt.sh
. ~/Scripts/git-completion.bash
alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='__git_ps1 \["\u@\h \w"] "\\\$ "'

export PATH=$PATH:/home/william/Scripts:/home/william/.gem/ruby/2.1.0/bin:/opt/android-sdk/platform-tools:/home/william/.gem/ruby/2.2.0/bin
export TERM=xterm-256color
alias home="ssh -L 5901:localhost:5901 kray"
alias vpn="/home/william/Scripts/vpn.sh"
alias tmux="/usr/bin/tmux -2"
alias wow="git status"
alias much="git"
alias very="git"
alias such="git"

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

