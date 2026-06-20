{ ... }: {
  # programs.niri.settings is provided automatically by niri.nixosModules.niri
  # (via niri.homeModules.config) since home-manager runs as a NixOS module here.
  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;

    layout = {
      gaps = 8;
      focus-ring = {
        enable = true;
        width = 2;
      };
    };

    input = {
      keyboard.xkb.layout = "us";
      touchpad = {
        tap = true;
        natural-scroll = true;
        dwt = true;
      };
      focus-follows-mouse.enable = true;
    };
  };
}
