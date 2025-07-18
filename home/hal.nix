{ config, pkgs, ... }: {
  home.username = "hal";
  home.homeDirectory = "/home/hal";

  programs.home-manager.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    fastfetch
    gh
  ];

  # Optional: autostart quickshell
  xdg.configFile."quickshell/autostart.json".text = builtins.toJSON {
    apps = [ "quickshell" ];
  };

  home.stateVersion = "24.05";
}

