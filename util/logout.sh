#/bin/sh

OPTIONS=(
    "  Shut Down"
    "  Sleep"
    "  Reboot"
    "  Logout"
	"  Exit"
    )

    CHOICE=$(printf '%s\n' "${OPTIONS[@]}" | dmenu -c -l 5 -p "Logout menu:")

if [[ "$CHOICE" == "  Shut Down" ]]; then 
	shutdown now
elif [ "$CHOICE" == "  Sleep" ]; then
	systemctl suspend
elif [ "$CHOICE" == "  Reboot" ]; then
	reboot
elif [ "$CHOICE" == "  Logout" ]; then
	awesome-client "awesome.quit()"
fi
