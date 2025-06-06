{
  description = "NixOS flake of HynDuf";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:HynDuf/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      catppuccin,
      zen-browser,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      hostname = "nurly_3";
      username = "nurlyx";
    in
    {
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs username hostname;
        };
        modules = [

          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./hosts/hynduf
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${username}" = {
              imports = [
                ./home
                {
                  home.packages = [ zen-browser.packages.${system}.specific ];
                }
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
        ];
      };
    };
}
