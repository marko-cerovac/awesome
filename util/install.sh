#!/bin/sh


# This is a simple install script that installs the dependencies for
# this verion of the awesome wm desktop

# Check if the OS is Arch Linux
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME

else
	OS="Other"
fi

if [ "$OS" == "Arch Linux" ]; then

	# Install the packages from the main repositories
	sudo pacman -S --noconfirm alacritty pcmanfm ranger pavucontrol feh sxiv

	if [ -x "/bin/paru" ]; then

		# Install the AUR packages
		paru -S brave-bin iwgtk picom-jonaburg-git vscodium-bin j4-dmenu-desktop nerd-fonts-source-code-pro

	else

		echo "The script needs paru AUR helper to proceed"

	fi

else

	echo "The install script is intended for Arch Linux"

fi
