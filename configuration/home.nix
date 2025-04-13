{ config, pkgs, lib, inputs, ... }:
let
  zen-browser-pkg = inputs.zen-browser.packages.${pkgs.system}.beta;
in
{
  imports = [
    ./programs/install-user.nix
    ./wm/hyprland.nix
  ];

  programs.home-manager.enable = true;
  home.username = "chenhsi";
  home.homeDirectory = "/home/chenhsi";
  home.stateVersion = "25.05";

  fonts.fontconfig.enable = true;

xdg.portal = {
    enable = true;
    wlr.enable = true;
    
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    NIXOS_OZONE_WL = "1";
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-text-pthread
    ];
  };
  
  home.activation.installPackages = {
    data = lib.mkForce "";
    before = lib.mkForce [];
    after = lib.mkForce [];
  };

  home.file = {
    nix-profile = {
      source = config.home.path;
      target = ".nix-profile";
    };
  };
}
