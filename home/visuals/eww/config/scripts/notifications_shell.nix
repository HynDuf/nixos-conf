{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.pygobject3
    pkgs.python3Packages.dbus-python
    pkgs.glib
    pkgs.gtk3
    pkgs.gdk-pixbuf
  ];

  shellHook = ''
    echo "Setting up environment..."
    export PYTHONPATH=$(python -m site --user-site):$PYTHONPATH
    echo "Environment setup complete. You can now run your script."
  '';
}
