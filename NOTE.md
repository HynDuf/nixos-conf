# Things that might be useful

- [Fonts](#fonts)
  * [Custom fonts](#custom-fonts)
  * [Find nerd fonts](#find-nerd-fonts)
- [Firefox](#firefox)
  * [Custom CSS](#custom-css)
  * [Tree Style Tabs](#tree-style-tabs)
  * [Correct PDF font](#correct-pdf-font)
- [Add `copyq` shortcuts for "Show the tray menu" as Super + Shift + V](#add--copyq--shortcuts-for--show-the-tray-menu--as-super---shift---v)
- [Reload nvchad highlight overrides](#reload-nvchad-highlight-overrides)
- [Fix Zotero tab bar gtk dark mode (Zotero 6)](#fix-zotero-tab-bar-gtk-dark-mode--zotero-6-)
- [Archived](#archived)
  * [`zsh` to `fish`](#-zsh--to--fish-)
## Fonts
### Custom fonts
Remember to `fc-cache -fv`. It seems that NixOS rebuild only run `fc-cache` so it might miss your custom fonts.
### Find nerd fonts
Search for the name of the nerd font (to install with NixOS):
[https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts).

Then, use the name on the URL to install it with NixOS.

Additional Links:
- [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/)

## Firefox 
The original author of this is [@AmadeusWM](https://github.com/AmadeusWM), please see [this](https://github.com/AmadeusWM/dotfiles-hyprland?tab=readme-ov-file#firefox) for more details.
### Custom CSS

First and foremost, go to `about:addons` in your firefox. And enable the `Dark` theme.
1. In Firefox go to `about:config`. Change `toolkit.legacyUserProfileCustomizations.stylesheets` to `True`.
2. Also, to enable custom SVG icons, go to about:config and set `svg.context-properties.content.enabled` to `True`.
3. Find your profile folder (go to the url `about:profiles` in firefox, and open the folder of your active profile).
4. Copy the `chrome` folder from `home/programs/firefox` to the aforementioned profile folder.
5. Restart firefox, you theme should be updated.

### Tree Style Tabs
1. Install the Tree Style Tabs extension from [here](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/).
2. Visit `Preferences` with `ctrl+shift+a>Tree Style Tab>Preferences`
3. Scroll to the bottom, and Press `Import` in `All Configs`.
4. Import the `config.json` from `home/programs/firefox/tree_stype_tab`.
5. Then go to `Advanced` and scroll down.
6. Choose `Load from file` and upload the following `home/programs/firefox/tree_stype_tab/tree_style_tab.css` (*optional*: if the theme of TST doesn't match the new firefox theme).

### Correct PDF font 
In `about:configs`, set `browser.display.use_document_fonts` to `0`.

## Add `copyq` shortcuts for "Show the tray menu" as Super + Shift + V

The old way of using `sxhkd` to map `copyq menu` to Super + Shift + V is deprecated. As it doesn't work properly on my NixOS anymore. So just set the keymapping in the `copyq` settings itself.

## Reload nvchad highlight overrides 
Open `:Lazy` and rebuild (`gb`) `base46` plugin

## Fix Zotero tab bar gtk dark mode (Zotero 6)

[https://github.com/zotero/zotero/issues/1999#issuecomment-1843332149](https://github.com/zotero/zotero/issues/1999#issuecomment-1843332149)

Use `home/programs/zotero/chrome/userChrome.css` for few color fixes that matches Catppuccin.

## Archived
### `zsh` to `fish`
I have migrated to `fish`. If you want to use `zsh` with nearly the same functionalities as `fish` check my migration commit [here](https://github.com/HynDuf/nixos-conf/commit/7af7e76aea6e53e6ed0588de907b4ca8194097c7) and [here](https://github.com/HynDuf/nixos-conf/commit/ae4becb6399cc677bbca9f4c61f8cd87b21ebfdb). 

But believe me, `fish` is so much better (faster with full-fledged functionalities built-in).
### `dunst`
I have migrated to using `eww` for notifications. If you want to use `dunst`, see [my commit here](https://github.com/HynDuf/nixos-conf/commit/95879a3280cd8c2fbb6774fa50c1b9032aeb99a0).
