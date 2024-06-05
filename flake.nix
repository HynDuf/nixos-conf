{
    description = "NixOS flake of HynDuf";

    inputs = {
        # NixOS official package source, using the nixos-23.11 branch here
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        catppuccin.url = "github:catppuccin/nix";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, catppuccin, home-manager, ... }@inputs: {
        nixosConfigurations.yoru = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [

                # Import the previous configuration.nix we used,
                # so the old configuration file still takes effect
                ./hosts/hynduf
                catppuccin.nixosModules.catppuccin
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.hynduf = {
                        imports = [
                            ./home
                            catppuccin.homeManagerModules.catppuccin
                        ];
                    };

                    # Optionally, use home-manager.extraSpecialArgs to pass
                    # arguments to home.nix
                }
            ];
        };
    };
}
