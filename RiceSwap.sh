#!/bin/bash

# Verifies if the terminal is using a Nerd Font
check_nerd_font() {
    echo -e "" >/dev/null 2>&1 || {
        echo " Nerd Font not detected. Please use a terminal with Nerd Fonts"
        echo " Aborting"
        exit 1
    }
}
check_nerd_font

# ASCII Art
cat <<ASCII

██████╗ ██╗ ██████╗███████╗
██╔══██╗██║██╔════╝██╔════╝
██████╔╝██║██║     █████╗
██╔══██╗██║██║     ██╔══╝
██║  ██║██║╚██████╗███████╗
╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝

███████╗██╗    ██╗ █████╗ ██████╗ ██████╗ ███████╗██████╗
██╔════╝██║    ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
███████╗██║ █╗ ██║███████║██████╔╝██████╔╝█████╗  ██████╔╝
╚════██║██║███╗██║██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██╗
███████║╚███╔███╔╝██║  ██║██║     ██║     ███████╗██║  ██║
╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝

ASCII

# General Symlink function
Symlinks() {
    SOURCE="$1"
    REPEAT="$HOME/.config/kitty $HOME/.config/fish"

    # Verifies the variable directories
    echo " $SOURCE"
    echo

    sleep 0.5

    # Create symlinks in base of the selected Rice
    rm -rf "$REPEAT"
    echo "󱄀 Creating Symlinks between $SOURCE and $HOME./.config"
    ln -sf "$SOURCE"/* "$HOME/.config/"
    echo

    sleep 0.5

    # Checks if symlinks were correctly created
    echo "󱉶 Verifying symlinks in $HOME./.config"
    for file in "$SOURCE"/*; do
        basefile=$(basename "$file")
        if [ -L "$HOME/.config/$basefile" ]; then
            echo " $basefile"
        else
            echo " $basefile Please do this symlink manually later"
        fi
    done
    echo

    sleep 1

    echo "  Swap complete."
    killall waybar && killall hyprpaper && hyprctl reload
    waybar & hyprpaper & kitty &
    exit
}


echo "󰟪 Select a Rice"
while true; do
    echo -e "\033[1mGruvbox\033[0m [G] / \033[1mEverforest\033[0m [E]"
    read -r -p "󱞩 " Prompt
    Prompt="${Prompt,,}"
    [[ "$Prompt" =~ ^(g|e|)$ ]] && break
    echo " Please enter [g/e]."
done

case "$Prompt" in
    g) Symlinks "$HOME/.dotfiles/Gruvbox/.config/" ;;
    e) Symlinks "$HOME/.dotfiles/Everforest/.config/" ;;
    *)
        echo "Aborting..."
        sleep 1
        exit 1
        ;;
esac
