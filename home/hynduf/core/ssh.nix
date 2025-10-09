{ pkgs, ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host github.com
          User git
          Hostname ssh.github.com
          PreferredAuthentications publickey
          ForwardAgent yes
          IdentityFile ~/.ssh/id_ed25519
          AddKeysToAgent yes
    '';
  };
}
