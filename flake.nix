{
  description = "NixOS config for Zephyrus G14 (starlord) with Hyprland, niri, NVIDIA+AMD, gaming+dev tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, niri, noctalia, ... }@inputs: {
    nixosConfigurations = {
      starlord = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/starlord.nix
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri
          noctalia.nixosModules.default
        ];
      };
    };
  };
}
