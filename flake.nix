{
  description = "NixOS config for Zephyrus G14 (starlord) with Hyprland, NVIDIA+AMD, gaming+dev tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      starlord = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/starlord.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

