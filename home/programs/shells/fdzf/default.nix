{ pkgs, config, ... }:
{
  programs.fzf = {
    enable = true;

    changeDirWidgetCommand = "fd --type d --hidden";
    changeDirWidgetOptions = [
      "--preview 'eza --tree --icons --color=always {} | head -200'"
    ];

    fileWidgetCommand = "fd --type f --hidden";
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
  };

  programs.fd = {
    enable = true;
  };
}
