{ pkgs, lib, config, ... }:

{
imports = [
    ./input/fcitx5.nix
    ./services/qt6ct.nix
  ];

  programs.hyprland = {
    enable = true;
    # xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
}
