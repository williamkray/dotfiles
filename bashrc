# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

## load up a bunch of other things
source ~/.scripts/git-prompt.sh
source /usr/share/bash-completion/completions/git
source ~/.scripts/pass.bash-completion
#source /etc/bash_completion.d/*
source ~/.scripts/aws-prompt.sh
#source ~/.scripts/bw-helper-functions.sh

## set a special prompt icon (arrow)
## this makes it easy to change the character
prompticon() {
  echo \ $'\u25B6'\ 
}

PROMPT_COMMAND='__git_ps1 "[\W]$(__aws_prompt)" "$(prompticon)"'

#export PASSWORD_STORE_GENERATED_LENGTH=16
#export PASSWORD_STORE_ENABLE_EXTENSIONS=true
#export PASSWORD_STORE_EXTENSIONS_DIR=$HOME/Projects/password-store-extensions
#export PATH=$PATH:/home/william/.scripts:/home/william/.gem/ruby/2.1.0/bin:/opt/android-sdk/platform-tools:/home/william/.gem/ruby/2.2.0/bin

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xdefaults | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
