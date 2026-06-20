{ pkgs, inputs, ... }: {
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    package = pkgs.noctalia;
    systemd.enable = true;
  };
}
