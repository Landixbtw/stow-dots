#!/bin/bash

echo "Installing packages from package list"

sudo pacman -S --needed - < package_list.txt
yay -S --needed - < aur_packages.txt
