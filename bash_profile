#
# ~/.bash_profile
#

## now we can load our bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
## handle some file-opener issues with mimetypes
#. ~/.scripts/xdg-gvfs-open.sh

## add all the things to our PATH
export PATH=$HOME/.local/bin:$HOME/.scripts:$PATH

export EDITOR=vim
#export BROWSER=firefox-launcher.sh
export BROWSER=firefox
## some pacaur vars
#export BUILDDIR="/tmp/pacaurtmp-$USER"
#export PKGDEST="$HOME/"
export XDG_CACHE_HOME=/dev/shm
complete -C '/usr/bin/aws_completer' aws

# use wayland for mozilla apps
export MOZ_ENABLE_WAYLAND=1

#export BW_SESSION=${BW_SESSION:-$(bw unlock --raw)}
#wait
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && export XDG_CURRENT_DESKTOP=sway && exec sway

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
