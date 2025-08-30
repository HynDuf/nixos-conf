#!/usr/bin/env bash
set -e

# --- CONFIGURATION ---
DEB_FILE_PATH="/home/hynduf/DistroBox/nvidia-tools/nsight-systems-2025.5.1_2025.5.1.121-1_amd64.deb"
RUN_FILE_PATH="/home/hynduf/DistroBox/nvidia-tools/nsight-compute-linux-2025.3.0.19-36273991.run"
CONTAINER_NAME="nvidia-tools"
CONTAINER_HOME="$HOME/Machines/$CONTAINER_NAME"
# ---------------------

# Verify files
if [ ! -f "$DEB_FILE_PATH" ] || [ ! -f "$RUN_FILE_PATH" ]; then
  echo "Error: Installer files not found." && exit 1
fi

# Clean up
echo "--- Removing old container '$CONTAINER_NAME' ---"
if distrobox list $CONTAINER_MGR_FLAG | grep -q " $CONTAINER_NAME "; then
  distrobox rm $CONTAINER_MGR_FLAG "$CONTAINER_NAME" --force
fi
rm -rf "$CONTAINER_HOME"

# Create container
echo "--- Creating container '$CONTAINER_NAME' with Podman ---"
distrobox create $CONTAINER_MGR_FLAG --name "$CONTAINER_NAME" --image ubuntu:24.04 --home "$CONTAINER_HOME"

# Install inside
echo "--- Starting installation inside the container... ---"
distrobox enter $CONTAINER_MGR_FLAG "$CONTAINER_NAME" -- /bin/bash -c '
  set -e
  DEB_FILE="'"$DEB_FILE_PATH"'"
  RUN_FILE="'"$RUN_FILE_PATH"'"
  
  echo "--- Updating package lists ---"
  sudo apt-get update
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libgtk-3-0 libsm6 x11-utils libdw1 libopengl0 libnss3 libasound2t64

  # --- Install Nsight Systems (.deb) ---
  echo "--- Installing Nsight Systems ---"
  # FIX 1: Copy the .deb to /tmp first to avoid apt permission warnings.
  cp "$DEB_FILE" /tmp/nsight-systems.deb
  sudo apt-get install -y /tmp/nsight-systems.deb

  # --- Install Nsight Compute (.run) ---
  echo "--- Installing Nsight Compute ---"
  cp "$RUN_FILE" /tmp/nsight-compute.run
  chmod +x /tmp/nsight-compute.run
  # FIX 2: Use "--" to pass silent flags to the internal installer script.
  # We also add --quiet for the outer makeself wrapper.
  sudo /tmp/nsight-compute.run --quiet --nox11

  # --- Create .desktop file for Nsight Compute ---
  echo "--- Creating .desktop file for Nsight Compute ---"
  sudo tee /usr/share/applications/ncu-ui.desktop > /dev/null <<'"'EOF'"'
[Desktop Entry]
Name=NVIDIA Nsight Compute
Comment=Profile and analyze CUDA kernels
Exec=/usr/local/NVIDIA-Nsight-Compute/ncu-ui
Icon=nvidia
Terminal=false
Type=Application
Categories=Development;IDE;
EOF

  # --- Export both applications to the host ---
  echo "--- Exporting applications to NixOS host ---"
  distrobox-export --app nsys-ui
  distrobox-export --app ncu-ui

  echo "--- Container installation complete! ---"
'

echo "--- All Done! ---"
