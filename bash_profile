#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
export BROWSER=google-chrome-stable
## some pacaur vars
export BUILDDIR="/tmp/pacaurtmp-$USER"
export XDG_CACHE_HOME=/dev/shm
export TMUX_MASTER="tmux-master"
#export SDL_AUDIODRIVER=alsa

export SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#startx

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

ht() {
  task="$@"
  hamster start "$task"
}

hs() {
  hamster stop
}
