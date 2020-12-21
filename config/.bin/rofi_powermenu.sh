#!/bin/sh -e

EXIT="  Exit"
HIBERNATE="❄  Hibernate"
LOCK="  Lock"
REBOOT="  Reboot"
SHUTDOWN="  Shutdown"
SUSPEND="鈴  Suspend"

OPTIONS="$EXIT\n$HIBERNATE\n$LOCK\n$REBOOT\n$SHUTDOWN\n$SUSPEND"
COMMAND="rofi -i -theme text-menu.rasi"

_menu(){
    option="$(echo -e "$OPTIONS" | $COMMAND -dmenu | tr -d '\r\n')"
    if [ ${#option} -gt 0 ] ; then
        case "$option" in
            $EXIT)
                bspc quit
                ;;
            $HIBERNATE) 
                # systemctl hibernate
                echo "WIP - Hibernation"
                ;;                
            $LOCK)
                $HOME/.bin/i3lock_lockscreen.sh
                ;;
            $REBOOT) 
                systemctl reboot
                ;;
            $SHUTDOWN) 
                systemctl poweroff
                ;;
            $SUSPEND)
                # systemctl suspend
                echo "WIP - Suspension"
                ;;
        esac
    fi
}

_menu