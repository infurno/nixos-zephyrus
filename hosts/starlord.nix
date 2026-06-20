{ config, pkgs, inputs, ... }: {
  imports = [
    ../hardware/starlord.nix
    ../modules/common.nix
  ];

  nixpkgs.overlays = [ inputs.noctalia.overlays.default inputs.llm-agents.overlays.default ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.hal = import ../home/hal.nix;

  networking.hostName = "starlord";

  # niri added alongside Hyprland (programs.hyprland.enable is in modules/common.nix).
  # greetd (see modules/common.nix) shows a session picker so you choose either at login.
  programs.niri.enable = true;

  # NVIDIA + AMD Hybrid Setup
  # TODO(new laptop): different GPU/model than this was written for. Verify hybrid
  # graphics still applies, and get real bus IDs via `lspci | grep -E "VGA|3D"` before relying on this.
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    prime = {
      sync.enable = true;
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  users.users.hal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" "libvirtd" ];
  };

  # Matches the nixos-graphical-26.05 installer ISO on your USB. Don't bump this
  # on later upgrades — it's just a compat anchor for the first install.
  system.stateVersion = "26.05";
}

