{ config, pkgs, ... }:
{
    programs.fish = {
        enable = true;
        shellInit = ''
        set -g fish_greeting
        eval (direnv hook fish)
        eval (ssh-agent -c) &>/dev/null
        function joshuto
            set -l ID $fish_pid
            mkdir -p /tmp/$USER
            set -l OUTPUT_FILE "/tmp/$USER/joshuto-cwd-$ID"
            env ~/bin/joshuto_ueberzugpp --output-file "$OUTPUT_FILE" $argv
            set -l exit_code $status

            switch "$exit_code"
                case 0
                    # regular exit
                    # no action needed
                case 101
                    # output contains current directory
                    set -l JOSHUTO_CWD (cat "$OUTPUT_FILE")
                    cd "$JOSHUTO_CWD"
                case 102
                    # output selected files
                    # no action needed
                case '*'
                    echo "Exit code: $exit_code"
            end
        end

        function erdtree_level
            set -l level "$argv[1]"
            set argv (string trim -l 1 $argv)
            erd -H -I -i -. --no-git -L "$level" $argv
        end
        set -x GTK_IM_MODULE ibus
        set -x QT_IM_MODULE ibus
        set -x XMODIFIERS @im=ibus
        set -x QT4_IM_MODULE ibus
        set -x CLUTTER_IM_MODULE ibus
        set -x GLFW_IM_MODULE ibus
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
            j = "joshuto";
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