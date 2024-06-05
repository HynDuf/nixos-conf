{ pkgs, config, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        initExtra = ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        '';

        shellAliases = {
            update = "sudo nixos-rebuild switch";
            v = "nvim";
            r = "joshuto";
        };
        zplug = {
            enable = true;
            plugins = [
            { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
            ];
        };

    };
}