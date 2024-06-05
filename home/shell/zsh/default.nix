{ pkgs, config, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion = {
            enable = true;
            highlight = "fg=#585b70,underline";
        };
        syntaxHighlighting.enable = true;
        initExtra = ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        '';
        autocd = true;
        defaultKeymap = "emacs";

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