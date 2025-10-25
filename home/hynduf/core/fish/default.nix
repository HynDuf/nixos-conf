{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
      set -U fish_color_autosuggestion 6c7086
      set -U fish_color_cancel f38ba8
      set -U fish_color_command 89b4fa
      set -U fish_color_comment 7f849c
      set -U fish_color_cwd f9e2af
      set -U fish_color_cwd_root red
      set -U fish_color_end fab387
      set -U fish_color_error f38ba8
      set -U fish_color_escape eba0ac
      set -U fish_color_gray 6c7086
      set -U fish_color_history_current '\x2d\x2dbold'
      set -U fish_color_host 89b4fa
      set -U fish_color_host_remote a6e3a1
      set -U fish_color_keyword f38ba8
      set -U fish_color_normal cdd6f4
      set -U fish_color_operator f5c2e7
      set -U fish_color_option a6e3a1
      set -U fish_color_param f2cdcd
      set -U fish_color_quote a6e3a1
      set -U fish_color_redirection f5c2e7
      set -U fish_color_search_match '\x2d\x2dbackground\x3d313244'
      set -U fish_color_selection '\x2d\x2dbackground\x3d313244'
      set -U fish_color_status f38ba8
      set -U fish_color_user 94e2d5
      set -U fish_color_valid_path '\x2d\x2dunderline\x3dcba6f7'
      set -U fish_key_bindings fish_default_key_bindings
      set -U fish_pager_color_background '\x1d'
      set -U fish_pager_color_completion cdd6f4
      set -U fish_pager_color_description 6c7086
      set -U fish_pager_color_prefix f5c2e7
      set -U fish_pager_color_progress 6c7086
      set -U fish_pager_color_secondary_background '\x1d'
      set -U fish_pager_color_secondary_completion '\x1d'
      set -U fish_pager_color_secondary_description '\x1d'
      set -U fish_pager_color_secondary_prefix '\x1d'
      set -U fish_pager_color_selected_background '\x1d'
      set -U fish_pager_color_selected_completion '\x1d'
      set -U fish_pager_color_selected_description '\x1d'
      set -U fish_pager_color_selected_prefix '\x1d'
      eval (direnv hook fish)
      function r
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end
      if test -z "$DISPLAY" ;and test "$XDG_VTNR" -eq 1
          mkdir -p ~/.cache
          exec Hyprland > ~/.cache/hyprland.log 2>&1
      end
    '';
    shellInitLast = ''
      dbus-update-activation-environment DISPLAY
    '';
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      v = "nvim";
      c = "code";
      g = "git";
      e = "erdtree_level";
      gaa = "git add .";
      gcm = "git commit -m";
      gp = "git push";
      clean_cache = "~/.config/bin/clean_nixos";
      getp = "kitty @ set-spacing padding=0 margin=0 && ssh getp06-vnm";
    };
  };
  xdg.configFile."fish/themes" = {
    source = ./themes;
  };
}
