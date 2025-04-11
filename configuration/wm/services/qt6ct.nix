{ config, pkgs, lib, ... }:
  imports = [
    ./input/fcitx5.nix
    ./services/qt6ct.nix
  ];
{
  qt.enable = true;
  qt.platformTheme = lib.mkForce "qt5ct";

  environment.systemPackages = with pkgs; [ 
    libsForQt5.qt5ct libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum kdePackages.qt6ct
  ];
}