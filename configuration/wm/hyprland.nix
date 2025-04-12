{ pkgs, lib, config, ... }:

{
imports = [
    ./input/fcitx5.nix
    ./services/qt6.nix
  ];

  programs.hyprland = {
    enable = true;
    # xwayland.enable = true;
  };
  
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        lock_cmd = "${lib.getExe config.programs.hyprlock.package}";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };

  programs.hyprlock.enable = true;
}
