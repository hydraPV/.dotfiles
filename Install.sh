#! /bin/bash

# ASCII Art
cat << ASCII



 █████                     █████              ████  ████
░░███                     ░░███              ░░███ ░░███
 ░███  ████████    █████  ███████    ██████   ░███  ░███
 ░███ ░░███░░███  ███░░  ░░░███░    ░░░░░███  ░███  ░███
 ░███  ░███ ░███ ░░█████   ░███      ███████  ░███  ░███
 ░███  ░███ ░███  ░░░░███  ░███ ███ ███░░███  ░███  ░███
 █████ ████ █████ ██████   ░░█████ ░░████████ █████ █████
░░░░░ ░░░░ ░░░░░ ░░░░░░     ░░░░░   ░░░░░░░░ ░░░░░ ░░░░░



ASCII

echo "This is an installation script made by me, so even if im quite sure that this shouldn't do anything harmful, run at your own risk"
echo
echo "Do you wanna run the script?"
echo "[Y] | [N]"

# Loop for valid input
read -r -p "> " MainPrompt
while [[ ! "$MainPrompt" =~ ^[yn]$ ]]; do
    echo "Invalid input, please enter 'Y' for 'Yes' or 'N' for 'No'"
    read -r -p "> " MainPrompt
done

case "$MainPrompt" in
    y) echo "Installing packages..." ;;
    n) exit ;;
esac

# Check for an existing AUR helper
if command -v yay >/dev/null 2>&1; then
    AUR="yay"
elif command -v paru >/dev/null 2>&1; then
    AUR="paru"
else
    # Install an aur helper
    echo "There is no AUR helper installed"
    echo "An AUR helper is needed for the installation process, want to install yay or paru?"
    echo "[Y] - yay | [P] - paru | N - exit"
    read -r -p "> " AURPrompt
    while [[ ! "$AURPrompt" =~ ^[ypn]$ ]]; do
        echo "Invalid input, please enter 'Y' for yay,'P' for paru. 'N' for exit"
        read -r -p "> " AURPrompt
    done
    install="sudo pacman -S --needed git base-devel && git clone"
    case "$AURPrompt" in
        y) $install https://aur.archlinux.org/yay.git && (cd yay && makepkg -si) && AUR="yay" ;;
        p) $install https://aur.archlinux.org/paru.git && (cd paru && makepkg -si) && AUR="paru" ;;
        n) exit 1 ;;
        *) exit 1 ;;
    esac
fi

packages=(hyprland hyprpaper kitty fish neovim wl-clipboard waybar nautilus nwg-look cava rofi dunst fastfetch ttf-iosevka-nerd ttf-jetbrains-mono-nerd phinger-cursors git fzf)
if [ -z "$AUR" ]; then
    echo "No AUR helper detected, please install it manually"
    echo "Aborting..."
fi
$AUR --noconfirm --needed --removemake -S "${packages[@]}"

echo "Package installation finished"
echo "If any package installation failed, install it manually later"
echo
echo "Running RiceSwap.sh..."
./RiceSwap.sh
