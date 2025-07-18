{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git curl wget btop glances
    kitty neovim micro
    vlc mpv yt-dlp
    jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji
    flatpak docker-compose
    steam mangohud gamemode lutris wine-staging vulkan-tools
    waybar rofi-wayland swaync swww hypridle hyprlock
    quickshell
    pavucontrol gnome.gnome-disk-utility gnome.gnome-calculator
    thunar thunar-archive-plugin xarchiver
  ];

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    tlp.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
    blueman.enable = true;
    flatpak.enable = true;
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      displayManager.startx.enable = false;
      windowManager.hyprland.enable = true;
    };
  };

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };

  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

