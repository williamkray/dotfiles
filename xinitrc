source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
## disable my touchscreen supposedly
#xinput disable $(xinput list|grep -i touchscreen|awk -F '=' '{print $2}'|awk '{print $1}')
## touchpad settings
syndaemon -t -k -i 2 -d
xrdb -merge ~/Projects/dotfiles/Xresources
eval $(gnome-keyring-daemon --start)
fehbg.sh
redshift &
unclutter &
xautolock -time 5 -locker ~/Projects/scripts/myslock.sh &
picom -c -r 12 -D 2 --inactive-dim .1 --vsync --backend glx --glx-no-stencil --glx-no-rebind-pixmap -b
~/.scripts/dwm-status.sh &
exec dwm
#exec openbox-session
