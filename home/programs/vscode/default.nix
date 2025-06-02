{ pkgs, config, ... }:

let
  unstable = import
    (builtins.fetchTarball {
      name = "unstable";
      url = "https://github.com/nixos/nixpkgs/archive/23c614c23fc7b11aec51ed715fbe096f3ba5afe5.tar.gz";
      sha256 = "1hmgk1ff4xi568bcz5x2284nx29a8yfkcf6k8jqf5yagrhxxyqwm";
    }) {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
      mkhl.direnv
    ];
    package = unstable.vscode;
  };
}
