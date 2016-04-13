#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
## some pacaur vars
export BUILDDIR="/tmp/pacaurtmp-$USER"
export XDG_CACHE_HOME=/dev/shm
export TMUX_MASTER="tmux-master"
#export SDL_AUDIODRIVER=alsa
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#startx

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

ht() {
  task="$@"
  hamster start "$task"
}

hs() {
  hamster stop
}
