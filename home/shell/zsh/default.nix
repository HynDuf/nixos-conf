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
        autocd = true;
        initExtra = ''
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        zstyle ':completion:*' matcher-list ''' \
        'm:{a-z\-}={A-Z\_}' \
        'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
        'r:|?=** m:{a-z\-}={A-Z\_}'
        eval "$(direnv hook zsh)"

        function joshuto() {
            ID="$$"
            mkdir -p /tmp/$USER
            OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
            env ~/bin/joshuto_ueberzugpp --output-file "$OUTPUT_FILE" $@
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
        # conda on zsh
        source ~/.conda/etc/profile.d/conda.sh

        # somehow bluetooth failed without this
        dbus-update-activation-environment DISPLAY
        '';

        shellAliases = {
            update = "sudo nixos-rebuild switch";
            v = "nvim";
            r = "joshuto";
            g = "git";
            gaa = "git add .";
            gcm = "git commit -m";
            gp = "git push";
            ca = "conda activate";
            cs = "conda-shell -c zsh";
        };
        history = {
            ignoreAllDups = true;
            size = 100000;
        };
    };
}