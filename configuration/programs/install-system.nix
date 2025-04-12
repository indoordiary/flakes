{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    #Utils
    git fastfetch xorg.xrandr wl-clipboard wlr-randr

    # Tools
    unzip unrar p7zip sof-firmware
    
  ];
}
