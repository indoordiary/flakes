{config, pkgs, lib, ...}:
{
  imports = [
    ./input/fcitx5.nix
    ./services/qt6ct.nix
  ];

  # Enable Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  services.xserver.displayManager.gdm.enable = true;   

  environment.systemPackages = with pkgs; [
    inconsolata fira-code noto-fonts-cjk-sans nerd-fonts.hurmit
    hyprland  hyprpicker hyprcursor hyprlock hypridle hyprpaper hyprshade hyprshot
    dwaybar xwaylan waypaper pyprland 
    waybar tofi fontconfig mako alacritty fish
    wlogout dunst kdePackages.qtwayland libsForQt5.qt5.qtwayland
    wlroots libxkbcommon pango cairo
  ];
  
}


