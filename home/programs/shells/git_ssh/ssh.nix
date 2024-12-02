{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host 112.137.129.158
            ForwardAgent yes
            IdentityFile ~/.ssh/id_ed25519
            AddKeysToAgent yes
            User nguyenthanhphat
            Compression no
            ServerAliveInterval 0
            ServerAliveCountMax 3
            HashKnownHosts no
            UserKnownHostsFile ~/.ssh/known_hosts
            ControlMaster no
            ControlPath ~/.ssh/master-%r@%n:%p
            ControlPersist no
      Host 112.137.129.161
            ForwardAgent yes
            IdentityFile ~/.ssh/id_ed25519
            AddKeysToAgent yes
            User phatnt
            Compression no
            ServerAliveInterval 0
            ServerAliveCountMax 3
            HashKnownHosts no
            UserKnownHostsFile ~/.ssh/known_hosts
            ControlMaster no
            ControlPath ~/.ssh/master-%r@%n:%p
            ControlPersist no
      Host github.com
          User git
          Hostname ssh.github.com
          PreferredAuthentications publickey
          ForwardAgent yes
          IdentityFile ~/.ssh/id_ed25519
          AddKeysToAgent yes

      Host hpc01.vast.vn
          HostName hpc01.vast.vn
          User thaontp
          Port 7722
          ForwardAgent no
          AddKeysToAgent no
          Compression no
          ServerAliveInterval 0
          ServerAliveCountMax 3
          HashKnownHosts no
          UserKnownHostsFile ~/.ssh/known_hosts
          ControlMaster no
          ControlPath ~/.ssh/master-%r@%n:%p
          ControlPersist no

      Host uet-hpc.remote.hpc.farm
          HostName uet-hpc.remote.hpc.farm
          User diepht
          Port 22033
          ForwardAgent no
          AddKeysToAgent no
          Compression no
          ServerAliveInterval 0
          ServerAliveCountMax 3
          HashKnownHosts no
          UserKnownHostsFile ~/.ssh/known_hosts
          ControlMaster no
          ControlPath ~/.ssh/master-%r@%n:%p
          ControlPersist no
    '';
  };
}
