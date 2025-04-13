{ config, ... }:

{
  imports = [
    ./input/fcitx5/default.nix

    ./hypr/hyprland/default.nix

    ./hypr/hyprlock.nix
    ./hypr/hypridle.nix
    ./hypr/hyprpaper.nix
    ./hypr/polkit-agent.nix
  ];
}
