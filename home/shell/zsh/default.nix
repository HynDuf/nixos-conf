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
        eval "$(direnv hook zsh)"

        function joshuto() {
            ID="$$"
            mkdir -p /tmp/$USER
            OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
            env joshuto --output-file "$OUTPUT_FILE" $@
            exit_code=$?

            case "$exit_code" in
                # regular exit
                0)
                    ;;
                # output contains current directory
                101)
                    JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
                    cd "$JOSHUTO_CWD"
                    ;;
                # output selected files
                102)
                    ;;
                *)
                    echo "Exit code: $exit_code"
                    ;;
            esac
        }
        '';
        autocd = true;
        defaultKeymap = "emacs";

        shellAliases = {
            update = "sudo nixos-rebuild switch";
            v = "nvim";
            r = "joshuto";
        };
        history = {
            ignoreAllDups = true;
            size = 100000;
        };

    };
}