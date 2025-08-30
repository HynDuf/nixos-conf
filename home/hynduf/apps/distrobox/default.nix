{ pkgs, config, ... }:
{
  programs.distrobox = {
    enable = true;
    # containers."nvidia-tools" = {
    #   image = "ubuntu:24.04";
    #   home = "${config.home.homeDirectory}/Machines/nvidia-tools";
    #
    #   additional_packages = [
    #     "libgtk-3-0"
    #     "libsm6"
    #     "x11-utils"
    #     "libdw1"
    #     "libopengl0"
    #     "libnss3"
    #     "libasound2"
    #   ];
    #
    #   init_hooks = [
    #     ''
    #       set -e
    #       echo "--- Updating package lists ---"
    #       sudo apt-get update
    #
    #       cd /tmp
    #
    #       echo "--- Installing Nsight Systems from host file ---"
    #       # Using the Nix variable makes the path robust and portable
    #       sudo apt-get install -y "${config.home.homeDirectory}/DistroBox/nvidia-tools/nsight-systems-2025.5.1_2025.5.1.121-1_amd64.deb"
    #
    #       echo "--- Installing Nsight Compute from host file ---"
    #       cp "${config.home.homeDirectory}/DistroBox/nvidia-tools/nsight-compute-linux-2025.3.0.19-36273991.run" ./nsight-compute.run
    #       chmod +x nsight-compute.run
    #       sudo ./nsight-compute.run --accept-eula --silent --nox11
    #
    #       echo "--- Creating .desktop file for Nsight Compute ---"
    #       sudo tee /usr/share/applications/ncu-ui.desktop > /dev/null <<'EOF'
    #       [Desktop Entry]
    #       Name=NVIDIA Nsight Compute
    #       Comment=Profile and analyze CUDA kernels
    #       Exec=/usr/local/NVIDIA-Nsight-Compute/ncu-ui
    #       Icon=nvidia
    #       Terminal=false
    #       Type=Application
    #       Categories=Development;IDE;
    #       EOF
    #
    #       echo "--- Exporting applications to NixOS host ---"
    #       distrobox-export --app nsys-ui
    #       distrobox-export --app ncu-ui
    #
    #       echo "--- Distrobox setup hook complete! ---"
    #     ''
    #   ];
    # };
  };

  xdg.configFile."distrobox/distrobox.conf" = {
    source = ./distrobox.conf;
  };
}
