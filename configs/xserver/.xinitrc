#!/bin/sh

export BROWSER=~/bin/browser.sh
export EDITOR=~/bin/editor.sh

export PATH="${HOME}/bin:${PATH}"
export LANG=en_US.UTF-8
export COLORS=256
wmname LG3D

eval $(gpg-agent --daemon)
eval $(ssh-agent)

# Start audio before the apps
mixer -f /dev/mixer1 pcm 100 vol 100 mic 100

# Keyboard setup
xset r rate 180 30
setxkbmap -option "grp:lswitch" "us,hr"
xrdb ~/.Xdefaults

# Apps
jack_umidi -d /dev/umidi0.0 -B
jack_umidi -d /dev/umidi1.0 -B
qjackctl &
unclutter &
numlockx &
syncthing &
urxvt -name weechat -e ~/bin/weechat.sh &
urxvt -name ssh-add -e ssh-add ~/.ssh/id_rsa &
liferea &
~/bin/mail.sh &
keepassxc &
offlineimap &
(sleep 10 && gajim) &
(sleep 2 && xsetroot) &
jack_connect X18XR18:midi.TX X18XR18:midi.RX
jack_connect 'AudioBox 1818 VSL :midi.TX' 'AudioBox 1818 VSL :midi.RX'

exec i3
