source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
## disable my touchscreen supposedly
xinput disable $(xinput list|grep -Ei 'touchscreen|finger'|awk -F '=' '{print $2}'|awk '{print $1}')
xrdb -merge ~/.Xresources
eval $(gnome-keyring-daemon --start)
## replace pretty wallpaper with matching color of terminal
xsetroot -solid "#1D1F21"
#fehbg.sh
#redshift &
unclutter &
dunst &
xautolock -noclose -time 5 -locker ~/.scripts/screen-locker.sh -corners ---- -cornerdelay 0 -cornerredelay 600 &
#~/.screenlayout/default.sh
#picom -c -r 12 -D 2 --inactive-dim .1 --vsync --backend glx --glx-no-stencil --glx-no-rebind-pixmap -b
#~/.scripts/dwm-status.sh &
#exec dwm
autorandr --change
blueberry-tray
exec i3
#exec openbox-session
