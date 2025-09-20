#! /bin/bash

echo "This is an automated installation script meant to run exactly after chrooting and installing git"
echo "Are you sure you want to run this script?"
echo "[Y] | [N]"
echo

read -r -p "> " MainPrompt
while [[ ! "$MainPrompt" =~ ^[yn]$ ]]; do
    echo "Invalid input. Please enter 'y' for 'Yes' or 'n' for 'No'"
    read -r -p "> " MainPrompt
done

case "$MainPrompt" in

    y)
        echo "Seting time zone..."
        ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
        hwclock --systohc

        echo
        echo "Creating hostname..."
        echo "Hydra" > /etc/hostname
        
        echo 
        echo "Seting locales..."
        locale-gen
        echo "LANG=en_US.UTF-8" > /etc/locale.gen

        echo
        echo "Creating user Hydra..."
        pacman -S fish --noconfirm &>/dev/null
        useradd -m -G wheel -s /bin/fish Hydra
        gpasswd -a Hydra wireshark informant gamemode 

        echo
        echo "Type a password for the host user"
        passwd Hydra

        ;;

    n) echo "Aborting..." && exit;;

esac
