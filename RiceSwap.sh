#!/bin/bash

# ASCII Art
cat << ASCII



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

Reload() {
	hyprctl reload &>/dev/null &
	killall waybar && waybar &>/dev/null &
	killall hyprpaper && hyprpaper &>/dev/null &
	killall mako && mako &>/dev/null & 
}

Symlinks() {
	SOURCE="$1"

	printf "\n $SOURCE\n"
	printf "󱄀 Creating Symlinks between $SOURCE and $HOME./.config\n"

	ln -sf "$SOURCE"/* "$HOME/.config/"

	printf "\n󱉶 Verifying symlinks in $HOME./.config\n"
	for file in "$SOURCE"/*; do
		basefile=$(basename "$file")
		if [ -L "$HOME/.config/$basefile" ]; then
			printf " $basefile\n"
		else
			printf " $basefile Please do this symlink manually later\n"
		fi
	done

	sleep 1

	printf "\n Swap complete.\n"
}

printf "󰟪 Select a Rice\n"
while true; do
	printf "\033[1mGruvbox\033[0m [G] / \033[1mEverforest\033[0m [E]\n"
	read -r -p "󱞩 " Prompt
	Prompt="${Prompt,,}"
	[[ "$Prompt" =~ ^(g|e|)$ ]] && break
	printf " Please enter [g/e].\n"
done

case "$Prompt" in
	g)
		Symlinks "$HOME/.dotfiles/Gruvbox/.config"
		Reload
		exit 0
		;;
	e)
		Symlinks "$HOME/.dotfiles/Everforest/.config"
		Reload
		exit 0
		;;
	*)
		printf "Aborting..."
		exit 1
		;;
esac
