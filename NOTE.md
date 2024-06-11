## zsh to fish
I have migrated to `fish`. If you want to use `zsh` with nearly the same functionalities as `fish` check my migration commit [here](https://github.com/HynDuf/nixos-conf/commit/7af7e76aea6e53e6ed0588de907b4ca8194097c7) and [here](https://github.com/HynDuf/nixos-conf/commit/ae4becb6399cc677bbca9f4c61f8cd87b21ebfdb). 
## Setup SSH
WIP
## Custom fonts
Remember to `fc-cache -fc`. It seems that NixOS rebuild only run `fc-cache` so it might miss your custom fonts.
## Find nerd fonts
Search for the name of the nerd font (to install with NixOS):
[https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts).

Then, use the name on the URL to install it with NixOS.

Additional Links:
- [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/)

## Firefox Custom `chrome` CSS

## Add `copyq` shortcuts for "Show the tray menu" as Super + Shift + V

The old way of using `sxhkd` to map `copyq menu` to Super + Shift + V is deprecated. As it doesn't work properly on my NixOS anymore.