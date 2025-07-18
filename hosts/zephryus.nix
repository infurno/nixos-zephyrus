{ config, pkgs, ... }: {
  imports = [
    ../hardware/zephyrus.nix
    ../modules/common.nix
    ../home/hal.nix
  ];

  networking.hostName = "zephyrus";

  # NVIDIA + AMD Hybrid Setup
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
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" ];
  };
}

