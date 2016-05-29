source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
## disable my touchscreen supposedly
xinput disable $(xinput list|grep -i touchscreen|awk -F '=' '{print $2}'|awk '{print $1}')
## touchpad settings
syndaemon -t -k -i 2 -d
xrdb -merge ~/Projects/dotfiles/Xresources
#exec startxfce4
eval $(gnome-keyring-daemon --start)
exec openbox-session
