{ pkgs, lib, config, ... }:

{
imports = [
    ./input/fcitx5.nix
    ./services/qt6ct.nix
  ];

  environment.systemPackages = with pkgs;[
    grim
    slurp
    wl-clipboard
    jq
    blight
    obs-cli
    alacritty
    waybar
    rofi
    nautilus
    networkmanagerapplet
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services ={
    dbus.enable =true;
    pipewire =[
      enable = true;
      alsa.enable = true;
      pulse.enable =true;
    };
    xserver ={
      enable =true;
      layout = "Us";
      xkbVariant= ";
    };
  };

  pulseaudio.enable = false;

  networking.networkmanager.enable =true;

  # programs.hyprlock.enable = true;

  # programs.hypapers.enable = true;
}
