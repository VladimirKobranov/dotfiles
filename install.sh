#!/bin/bash

echo "Hello"
echo "Current lineup: Nvim, Fish"

# Directories
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dest_folder="$HOME/.config"

read -p "Do you want to install everything? (Y/n) " resp

if [ -z "$resp" ] || [ "$resp" == "y" ] || [ "$resp" == "yes" ]; then
	mkdir -p "$dest_folder"

	# Copy Fish folder
	find "$script_dir" -type d -name 'fish' -exec cp -r {} "$dest_folder" \;

	# Copy Nvim folder
	find "$script_dir" -type d -name 'nvim' -exec cp -r {} "$dest_folder" \;

	echo "Everything successfully installed"

	exit 0
fi

# Fish
read -p "Do you want to install Fish? (Y/n) " resp_fish

if [ -z "$resp_fish" ] || [ "$resp_fish" == "y" ] || [ "$resp_fish" == "yes" ]; then
	dest_fish="$HOME/.config/fish/"

	mkdir -p "$dest_fish"

	cp -r "$script_dir/fish/" "$dest_fish/"

	echo "Fish successfully installed"
else
	echo "return"
fi

# Nvim
read -p "Do you want to install Nvim? (Y/n) " resp_nvim

if [ -z "$resp_nvim" ] || [ "$resp_nvim" == "y" ] || [ "$resp_nvim" == "yes" ]; then
	dest_nvim="$HOME/.config/nvim/"

	mkdir -p "$dest_nvim"

	cp -r "$script_dir/nvim/" "$dest_nvim/"

	echo "Nvim successfully installed"
else
	echo "return"
fi

echo "Done"
