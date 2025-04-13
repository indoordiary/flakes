{ config, pkgs,... }:

{
  imports = [
    ./input/fcitx5/default.nix
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
      kdePackages.qtwayland
      libsForQt5.qt5ct
      libsForQt5.qtwayland
      xdg-desktop-portal-gtk
      uwsm
      hyprpolkitagent
      xdg-desktop-portal-hyprland
  ];

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  services.xserver.displayManager.gdm.enable = true; 
}
