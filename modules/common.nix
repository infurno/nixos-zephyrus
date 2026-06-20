{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git curl wget btop glances
    kitty alacritty neovim micro emacs
    vlc mpv yt-dlp
    jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji
    flatpak docker-compose
    steam mangohud gamemode lutris wine-staging winetricks vulkan-tools
    waybar rofi-wayland swaync swww hypridle hyprlock
    quickshell
    pavucontrol gnome.gnome-disk-utility gnome.gnome-calculator
    thunar thunar-archive-plugin xarchiver
    asusctl supergfxctl

    # ported over from thor.local
    ripgrep fd fzf bat eza zoxide tree tldr tokei hyperfine dust duf delta atuin
    distrobox gcc cargo rustc golang zig nodejs_22 python3 pipx pandoc
    gimp vscode okular gwenview neochat
    brave google-chrome vivaldi teams-for-linux vesktop obsidian
    beekeeper-studio rustdesk localsend prismlauncher rpi-imager
    heroic orca-slicer protonup-qt
    virt-manager
  ];

  services.ollama.enable = true;

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
    asusd.enable = true;
    supergfxd.enable = true;
    greetd = {
      enable = true;
      settings.default_session.command =
        "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session";
    };

    # ported over from thor.local
    syncthing = {
      enable = true;
      user = "hal";
      dataDir = "/home/hal/Sync";
    };
    tailscale.enable = true;
  };

  virtualisation.libvirtd.enable = true;

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

