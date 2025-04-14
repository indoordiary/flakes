{ lib, config, pkgs,... }:

{
  imports = [
    ./input/fcitx5/default.nix
    ./qt6ct.nix
  ];

  environment.systemPackages = with pkgs; [
      kitty
      dunst
      waybar
      brightnessctl
      pavucontrol
      pipewire
      wireplumber
      hyprpaper
      hyprlock
      hyprpicker
      grim
      slurp
      wofi
      cliphist
      xfce.thunar
      gvfs
      gtk4
      seahorse
      gnome-keyring
      libsForQt5.qt5ct
      libsForQt5.qtwayland
      kdePackages.qt6ct
      kdePackages.qtwayland
      xdg-desktop-portal-gtk
      uwsm
      hyprpolkitagent
      xdg-desktop-portal-hyprland
  ];

  programs.hyprland.enable = true;
}
