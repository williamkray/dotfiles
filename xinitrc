source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
## disable my touchscreen supposedly
xinput disable $(xinput list|grep -Ei 'touchscreen|finger'|awk -F '=' '{print $2}'|awk '{print $1}')
xrdb -merge ~/.Xresources
eval $(gnome-keyring-daemon --start)
## replace pretty wallpaper with matching color of terminal
xsetroot -solid "#1D1F21"
unclutter &
dunst &
xautolock -noclose -time 5 -locker ~/.scripts/screen-locker.sh -corners ---- -cornerdelay 0 -cornerredelay 600 &
## use this file for screenlock and dunst pausing
echo '' > ~/.pause
autorandr --change
blueberry-tray
exec i3
