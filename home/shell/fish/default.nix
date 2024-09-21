{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
      eval (direnv hook fish)
      eval (ssh-agent -c) &>/dev/null
      function r
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"
          if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
              cd -- "$cwd"
          end
          rm -f -- "$tmp"
      end

      if status --is-login
          if test -z "$DISPLAY" -a $XDG_VTNR = 1
              exec startx -- -keeptty
          end
      end
    '';
    shellInitLast = ''
      source ~/.conda/etc/fish/conf.d/conda.fish
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
      ca = "conda activate";
      cs = "conda-shell -c fish";
      clean_cache = "~/bin/clean_nixos";
    };
  };
  xdg.configFile."fish/fish_variables" = {
    source = ./fish_variables;
  };
  xdg.configFile."fish/themes" = {
    source = ./themes;
  };
}
