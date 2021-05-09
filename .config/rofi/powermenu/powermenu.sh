#!/usr/bin/env sh

power_off="Shut down"
reboot="Reboot"
lock="Lock"
suspend="Sleep"
log_out="Log out"

chosen=$(printf '%s;%s;%s;%s;%s\n' "$power_off" "$reboot" "$lock" "$suspend" \
                                   "$log_out" \
    | rofi -theme 'powermenu/powermenu.rasi' \
           -dmenu \
           -sep ';' \
           -selected-row 0)

case "$chosen" in
    "$power_off")
        poweroff
        ;;

    "$reboot")
        reboot
        ;;

    "$lock")
        # Pause music and mute volume before suspending.
        mpc --quiet pause
        qdbus org.kde.ksmserver /ScreenSaver org.freedesktop.ScreenSaver.Lock
        ;;

    "$suspend")
        # Pause music and mute volume before suspending.
        mpc --quiet pause
        amixer -q -D pulse sset Master mute
        systemctl suspend
        ;;

    "$log_out")
        qdbus org.kde.ksmserver /KSMServer logout 0 3 3
        ;;

    *) exit 1 ;;
esac
