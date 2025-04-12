{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # Desktop
    mako tofi waybar alacritty

    # Utils
    git fastfetch xorg.xrandr wl-clipboard wlr-randr

    # Tools
    unzip unrar p7zip sof-firmware

    # Social 
    qq wechat-uos telegra-desktop 

    # dev
    vscode typora

    # Entertainment
    bilibili qqmusic

    # inpus
    inputs.zen-browser.packages."${system}".beta
    
  ];
}
