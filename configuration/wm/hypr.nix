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

  environment.systemPackages = with pkgs; {
    waybar tofi fontconfig mako
    inconsolata fira-code noto-fonts-cjk-sans nerd-fonts.hurmit
  };
  
}


