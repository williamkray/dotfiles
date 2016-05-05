source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
## disable my touchscreen supposedly
xinput disable 9
## touchpad settings
syndaemon -t -k -i 2 -d
xrdb -merge ~/Projects/dotfiles/Xresources
#exec startxfce4
exec openbox-session
