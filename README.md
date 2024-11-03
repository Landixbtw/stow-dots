# gnu stow dotfile configuration

This is my stow dotfile config V2 for my laptop.

### Dependencies

You should only need yay installed.  

All of the packages needed will be installed by the ```./install-packages.sh`` script.

> ![WARNING]
> **DO NOT EXECUTE THE** ./load-packages.sh script since this will load the packages 
> on your system and overwrite the package list and aur package list

After installing all the packages you can either:  
```
stow nvim
```
To get only the symlinks for neovim  
or 
```
stow .
```
To get all the dotfiles setup  


##### 🗒️Todo

- Buttons for sound 
- Buttons for screen brightness
- Get fingerprint working
- Get keyboard backlight working


