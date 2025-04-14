{ config, pkgs, lib, inputs, ... }:
let
  zen-browser-pkg = inputs.zen-browser.packages.${pkgs.system}.beta;
in
{
  imports = [
    ../programs/install-user.nix
    ./wm/hypr/default.nix
    ./wm/theme/gtk.nix
  ];

  programs.home-manager.enable = true;
  home.username = "chenhsi";
  home.homeDirectory = "/home/chenhsi";
  home.stateVersion = "25.05";

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    userDirs.enable = true;
    configFile = {
    };
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
