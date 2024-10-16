#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
## only load this alias if we're using kitty as term emulator
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

export PATH=~/.local/bin:$PATH
source ~/.local/bin/git-prompt.sh
source /usr/share/bash-completion/completions/git

#PS1='[\u@\h \W]\$ '

## set a special prompt icon (arrow)
## this makes it easy to change the character
prompticon() {
  echo \ $'\u25B6'\ 
}
PROMPT_COMMAND='__git_ps1 "[\u@\h \W]" "$(prompticon)"'
