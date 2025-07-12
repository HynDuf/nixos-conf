{ pkgs, config, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
      mkhl.direnv
    ];
  };
}
