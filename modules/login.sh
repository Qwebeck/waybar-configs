#!/bin/bash

USER=$(whoami)
HOST=$(hostname)

get_menu() {
    echo '['
    echo '  {"text": "Lock", "command": "swaylock -f -c 000000"}'
    echo '  {"text": "Logout", "command": "swaymsg exit"},'
    echo '  {"text": "Suspend", "command": "systemctl suspend"},'
    echo '  {"text": "Reboot", "command": "systemctl reboot"},'
    echo '  {"text": "Shutdown", "command": "systemctl poweroff"}'
    echo ']'
}

case $1 in
    menu)
        get_menu
        ;;
    *)
        echo '{"text": "'$USER@$HOST'", "tooltip": "Click to open power menu"}'
        ;;
esac
