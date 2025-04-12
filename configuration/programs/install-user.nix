{ pkgs, inputs, ... }:
{
  imports = [
    ../wm/theme/default.nix
  ];

  home.packages = with pkgs; [
    # Desktop
    mako tofi waybar alacritty

    # Social 
    qq wechat-uos telegram-desktop 

    # dev
    vscode typora

    # Entertainment
    bilibili qqmusic

    # inpus
    inputs.zen-browser.packages."${system}".beta
  ];
}

