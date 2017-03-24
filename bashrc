# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.scripts/git-prompt.sh
. ~/.scripts/git-completion.bash
. ~/.scripts/pass.bash-completion
. ~/.scripts/aws-prompt.sh

## sets our aws default profile
## function defined in aws-prompt.sh
export -f setaws

## set a special prompt icon (arrow)
## this makes it easy to change the character
prompticon() {
  echo \ $'\u25B6'\ 
}

PROMPT_COMMAND='__git_ps1 "[\W]$(__aws_prompt)" "$(prompticon)"'

export PASSWORD_STORE_GENERATED_LENGTH=16
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR=$HOME/Projects/password-store-extensions

alias ls='ls --color=auto'

export PATH=$PATH:/home/william/.scripts:/home/william/.gem/ruby/2.1.0/bin:/opt/android-sdk/platform-tools:/home/william/.gem/ruby/2.2.0/bin
alias home="ssh -X -C -L 5901:localhost:5901 -L 5902:localhost:5900 -L 3389:localhost:3389 kray"
alias vpn="/home/william/.scripts/vpn.sh"
alias tmux="/usr/bin/tmux -2"
alias wow="git status"
alias much="git"
alias very="git"
alias such="git"
alias hosts="sudo vim /etc/hosts"
alias notes="vim ~/Notes/00_quick.txt"
alias dongers="$BROWSER ~/Notes/dongers.txt"
alias slock="slock -c \"#8c9440\" -d"
alias stagent="eval \"$(ssh-agent -s)\""
alias xdg-open='XDG_CURRENT_DESKTOP="GNOME" /usr/bin/xdg-open'
alias bbstagent="eval \"$(ssh-agent -s)\" && ssh-add ~/Work/projects/beachbody/keys/*"
alias bbokta="otp.sh $bb && ~/Work/projects/beachbody/Okta/get-aws-keys.py -p digiprod"
alias bbjenkins="bbstagent && ssh ip-10-200-0-46"
alias bbvpn="~/Work/projects/beachbody/bbstartvpn.exp"
alias gitconfci="git config user.name 'William Kray' && git config user.email wkray@corpinfo.com"
alias gitconfwk="git config user.name 'William Kray' && git config user.email william@kray.pw"

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

