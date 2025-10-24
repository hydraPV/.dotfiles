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
        NCN="--noconfirm &>/dev/null"
        PMS="pacman -S"
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
        $PMS fish "$NCN"
        useradd -m -G wheel -s /bin/fish Hydra

        echo
        echo "Type a password for the host user..."
        passwd Hydra
        
        echo
        echo "Installing GRUB..."
        $PMS grub efibootmgr "$NCN"
        grub-install --target=x86_64-efi --efi-directory /boot/ --bootloader-id=GRUB
        grub-mkconfig -o /boot/grub/grub.cfg
        
        echo
        echo "Installing essentials..."
        $PMS base base-devel pipewire pipewire-pulse pipewire-alsa alsa-utils networkmanager reflector neovim fish kitty "$NCN"

        echo
        echo "Select a kernel to install"
        echo "[1] Linux | [2] Zen | [3] LTS | [4] Hardened"
        read -r -p "> " KernelPrompt
        while [[ ! "$AURPrompt" =~ ^[1234]$ ]]; do
            echo "Invalid input, please enter '1', '2', '3' or '4'"
            read -r -p "> " KernelPrompt
        done

        case "$KernelPrompt" in
            1) $PMS linux linux-headers && DKMS=N;;
            2) $PMS linux-zen linux-zen-headers;;
            3) $PMS linux-lts linux-lts-headers;;
            4) $PMS linux-hardened linux-hardened-headers;;
        esac

        echo "There is no AUR helper installed"
        echo "An AUR helper is needed. Want to install yay or paru?"
        echo "[Y] - yay | [P] - paru | N - exit"
        read -r -p "> " AURPrompt
        while [[ ! "$AURPrompt" =~ ^[ypn]$ ]]; do
            echo "Invalid input, please enter 'Y' for yay,'P' for paru. 'N' for exit"
            read -r -p "> " AURPrompt
        done
        case "$AURPrompt" in
            y) git clone https://aur.archlinux.org/yay.git && (cd yay && makepkg -si) && AUR="yay" ;;
            p) git clone https://aur.archlinux.org/paru.git && (cd paru && makepkg -si) && AUR="paru" ;;
            n) exit 1 ;;
            *) exit 1 ;;
        esac

        echo
        echo "Installing gaming essentials..."
        $AUR -S steam wine wine-gecko wine-mono protontricks protonup-qt-bin gamemode gamescope mangohud btop "$NCN"

        echo
        echo ""
        ;;

    n) echo "Aborting..." && exit;;

esac
