{
  pkgs,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;
  };
  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
  home.packages =
    with pkgs;
    [
      (writeShellScriptBin "clean-nvim" ''
        rm -rf ${config.xdg.dataHome}/nvim
        rm -rf ${config.xdg.stateHome}/nvim
        rm -rf ${config.xdg.cacheHome}/nvim
      '')
      (writeShellScriptBin "clean-nvim-full" ''
        rm -rf ${config.xdg.dataHome}/nvim
        rm -rf ${config.xdg.stateHome}/nvim
        rm -rf ${config.xdg.cacheHome}/nvim
        rm -rf ${config.xdg.configHome}/nvim
      '')
      nodejs
      yarn
      ripgrep
      unzip
      fd
      wget
      tree-sitter
      gcc
      gnumake
      clang-tools
      bash-language-server
      shellcheck
      gopls
      nil
      alejandra
      shfmt
      lua-language-server
      stylua
      nodePackages_latest.typescript-language-server
      prettierd
      vscode-langservers-extracted
      pyright
      ruff
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard
      xclip
    ];
}
