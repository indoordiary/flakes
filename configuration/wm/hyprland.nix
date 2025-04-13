{ pkgs, lib, config, ... }:

{
imports = [
    ./input/fcitx5.nix
    ./services/qt6ct.nix
  ];

  environment.systemPackages = with pkgs;[
    hyprland
    xwayland 
    hyprpaper
    alacritty
    waybar
    tofi
    mako 
    nautilus
    polkit-kde-agent
    qt5ct
    qt6ct
    vlc
    qemu
    fcitx5-with-addons
    jq
    grim
    slurp
    wl-clipboard
    blight
    obs-cli
    pulseaudio
    networkmanagerapplet 
    coreutils
    gnused
    hyprctl
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.variables={
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE= "fcitx";
    XMODIFIERS ="@im=fcitx";
  };

  services = {
    dbus.enable = true;
    pipewire ={
      enable =true;
      alsa.enable = true;
      pulse.enable =true;
    };
  };

  services.xserver.displayManager.sessionCommands = ''
    export HYPRLAND_LOG_WLR=1
    export WLR_DRM_NO_ATOMIC=1
 '';

  networking.networkmanager.enable =true;

  # programs.hyprlock.enable = true;

  # programs.hypapers.enable = true;
}
