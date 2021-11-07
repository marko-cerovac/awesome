#/bin/sh

OPTIONS=(
    "Shut Down"
    "Sleep"
    "Reboot"
    "Logout"
    "Exit"
    )

    CHOICE=$(printf '%s\n' "${OPTIONS[@]}" | dmenu -c -l 5 -p "Logout menu")

if [[ "$CHOICE" == "Shut Down" ]]; then 
    $HOME/.config/awesome/util/prompt.sh "Do you want to shut down" "shutdown now"
elif [ "$CHOICE" == "Sleep" ]; then
	$HOME/.config/awesome/util/prompt.sh "Do you want to suspend" "systemctl suspend"
elif [ "$CHOICE" == "Reboot" ]; then
    $HOME/.config/awesome/util/prompt.sh "Do you want to reboot" "reboot"
elif [ "$CHOICE" == "Logout" ]; then
    $HOME/.config/awesome/util/prompt.sh "Do you want to logout" "logout"
fi
