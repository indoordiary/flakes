{ pkgs, config, ... }:

{
  imports = [
    ./input/fcitx5/default.nix

    ./hypr/hyprland/default.nix

    ./hypr/hyprlock.nix
    ./hypr/hypridle.nix
    ./hypr/hyprpaper.nix
    ./hypr/polkit-agent.nix
  ];

  config.optional.hypr.enable = true;

  environment.systemPackages = with pkgs; [
    catppuccin waybar mako
  ];
}
