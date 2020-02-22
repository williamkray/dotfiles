#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
## handle some file-opener issues with mimetypes
#. ~/.scripts/xdg-gvfs-open.sh
## for onica-sso
export PATH=$HOME/.local/bin:$PATH

export EDITOR=vim
#export BROWSER=firefox-launcher.sh
export BROWSER=firefox
## some pacaur vars
export BUILDDIR="/tmp/pacaurtmp-$USER"
export PKGDEST="$HOME/Build/built"
export XDG_CACHE_HOME=/dev/shm
export TMUX_MASTER="tmux-master"
complete -C '/usr/bin/aws_completer' aws

export BW_SESSION=${BW_SESSION:-$(bw login bitwarden@williamkray.com --raw)}
wait
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(onica-sso shell-init bash)"
