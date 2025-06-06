{
  config,
  pkgs,
  lib,
  ...
}:
{
  # NVIDIA settings

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    enableRedistributableFirmware = true;
  };

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    powerManagement = {
      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      finegrained = false;
    };

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.beta;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    nvidiaPersistenced = false;

    prime = {
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  # specialisation = {
  #     gpu_always.configuration = {
  #         hardware.nvidia.prime = {
  #             sync.enable = lib.mkForce true;

  #             offload = {
  #                 enable = lib.mkForce false;
  #                 enableOffloadCmd = lib.mkForce false;
  #             };
  #         };
  #     };
  # };

  services.thermald.enable = lib.mkDefault true;

  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
  };

  # boot.extraModprobeConfig = ''
  #     blacklist nouveau
  #     options nouveau modeset=0
  # '';

  # services.udev.extraRules = ''
  #     # Remove NVIDIA USB xHCI Host Controller devices, if present
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
  #     # Remove NVIDIA USB Type-C UCSI devices, if present
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
  #     # Remove NVIDIA Audio devices, if present
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
  #     # Remove NVIDIA VGA/3D controller devices
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  # '';
  # boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
}
