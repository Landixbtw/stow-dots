#!/bin/bash

# load the installed packages 
pacman -Qqe > package_list.txt
pacman -Qqm > aur_packages.txt
