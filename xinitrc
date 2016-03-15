## disable my touchscreen supposedly
xinput disable 9
## touchpad settings
syndaemon -t -k -i 2 -d
xrdb ~/Projects/dotfiles/Xresources
exec startxfce4
