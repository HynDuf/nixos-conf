{ pkgs, lib, ... }:

# terminals

let
    font = "JetBrainsMono Nerd Font";
in
{
    programs.kitty = {
        enable = true;
        settings = {
            scrollback_lines = 10000;

            # font
            font_family = font;
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";

            font_size = 14;

            cursor =  "#f530ff";

            cursor_shape = "beam";
            cursor_beam_thickness = "1.5";
            cursor_blink_interval = "0.25";

            scrollback_indicator_opacity = 1;

            # url settings
            url_color = "#0087bd";
            url_style = "curly";
            show_hyperlink_targets = "yes";
            underline_hyperlinks = "always";

            strip_trailing_spaces = "smart";

            # theme, https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.background_image_layout
            background_opacity = "0.7";
            # dynamic_background_opacity = "yes";
            foreground = "#dddddd";
            background = "#180204";
            background_blur = 30;
            # background_image = "none";

            repaint_delay = 5;

            remember_window_size = "yes";
            # initial_window_width = 640;
            # initial_window_height = 400;

            # tab bar
            tab_bar_edge = "top";
            # tab_bar_style = "slant";
            tab_bar_style = "powerline";
            tab_powerline_style = "angled";
            tab_bar_min_tabs = 1;
            tab_title_template = "({index}) ({num_window_groups}) {title}";

            active_tab_foreground = "#00b2b9";
            active_tab_background = "#170081";
            active_tab_font_style = "bold-italic";
            inactive_tab_foreground = "#005053";
            inactive_tab_background = "#05001e";
            inactive_tab_font_style = "normal";

            # customization
            # notify_on_cmd_finish = "never";
        };

        # keybinds
        keybindings = {
            # clipboard
            "ctrl+c" = "copy_and_clear_or_interrupt";
            "ctrl+v" = "paste_from_clipboard";

            # prompt manager
            "ctrl+shift+up" = "scroll_line_up";
            "ctrl+shift+k" = "scroll_line_up";
            "ctrl+shift+down" = "scroll_line_down";
            "ctrl+shift+j" = "scroll_line_down";
            "ctrl+shift+page_up" = "scroll_page_up";
            "ctrl+shift+page_down" = "scroll_page_down";
            "ctrl+shift+home" = "scroll_home";
            "ctrl+shift+end" = "scroll_end";
            "ctrl+shift+z" = "scroll_to_prompt -1";
            "ctrl+shift+x" = "scroll_to_prompt 1";
            "ctrl+shift+h" = "show_scrollback";
            "ctrl+shift+g" = "show_last_command_output";

            # window manager
            "ctrl+shift+enter" = "new_window";
            "ctrl+alt+enter" = "launch --cwd=current";
            "ctrl+n" = "launch --location=neighbor";
            "ctrl+shift+n" = "new_os_window";
            "ctrl+shift+w" = "close_window";
            "ctrl+shift+]" = "next_window";
            "ctrl+shift+[" = "previous_window";
            "ctrl+shift+f" = "move_window_forward";
            "ctrl+shift+b" = "move_window_backward";
            "ctrl+shift+`" = "move_window_to_top";

            # tab manager
            "ctrl+shift+right" = "next_tab";
            "ctrl+tab" = "next_tab";
            "ctrl+shift+left" = "previous_tab";
            "ctrl+shift+tab" = "previous_tab";
            "ctrl+shift+t" = "new_tab";
            "ctrl+shift+q" = "close_tab";
            "ctrl+shift+." = "move_tab_forward";
            "ctrl+shift+," = "move_tab_backward";
            "ctrl+alt+1" = "goto_tab 1";
            "ctrl+alt+2" = "goto_tab 2";
            "ctrl+alt+3" = "goto_tab 3";
            "ctrl+alt+4" = "goto_tab 4";
            "ctrl+alt+5" = "goto_tab 5";
            "ctrl+alt+6" = "goto_tab 6";
            "ctrl+alt+7" = "goto_tab 7";
            "ctrl+alt+8" = "goto_tab 8";
            "ctrl+alt+9" = "goto_tab 9";
            "ctrl+alt+0" = "goto_tab 99999999";

            "ctrl+shift+alt+t" = "set_tab_title";

            # layout manager
            "ctrl+shift+l" = "next_layout";
            "ctrl+alt+t" = "goto_layout tall";
            "ctrl+alt+s" = "goto_layout stack";
            "ctrl+alt+z" = "toggle_layout stack";

            # font manager
            "ctrl+shift+equal" = "change_font_size all +2.0";
            "ctrl+shift+plus" = "change_font_size all +2.0";
            "ctrl+shift+kp_add" = "change_font_size all +2.0";
            "ctrl+shift+minus" = "change_font_size all -2.0";
            "ctrl+shift+kp_subtract" = "change_font_size all -2.0";
            "ctrl+shift+backspace" = "change_font_size all 0";
            "ctrl+shift+0" = "change_font_size all 0";

            # misc
            "ctrl+shift+f11" = "toggle_fullscreen";
            "ctrl+shift+f10" = "toggle_maximized";
            "ctrl+shift+u" = "kitten unicode_input";
        };

        # enable integration
        shellIntegration.enableFishIntegration = true;
    };
}