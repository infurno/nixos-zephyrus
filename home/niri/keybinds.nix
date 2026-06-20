{ config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Return".action = spawn [ "kitty" ];
    "Mod+D".action = spawn [ "rofi" "-show" "drun" ];
    "Mod+Q".action = close-window;
    "Mod+Shift+E".action = quit;
    "Mod+F".action = fullscreen-window;

    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;

    "Print".action.screenshot = [ ];
  };
}
