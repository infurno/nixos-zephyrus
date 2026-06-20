{ config, pkgs, inputs, ... }: {
  imports = [ ./niri ];

  home.username = "hal";
  home.homeDirectory = "/home/hal";

  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.oh-my-posh.enable = true;

  home.packages = with pkgs; [
    fastfetch
    gh
    claude-code
    hermes-agent
  ];

  # Optional: autostart quickshell
  xdg.configFile."quickshell/autostart.json".text = builtins.toJSON {
    apps = [ "quickshell" ];
  };

  home.stateVersion = "26.05";
}

