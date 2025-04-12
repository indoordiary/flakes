{ pkgs, inputs, ... }:
{
  imports = [
    ../wm/theme/default.nix
  ];

  home.packages = with pkgs; [
    hyprland 
    waybar
    tofi
    mako
    alacritty

    qqmusic
    bilibili

    qq
    wechat-uos
    telegram-desktop
    
    wpsoffice-cn
    vscode-fhs
    typora

    inputs.zen-browser.packages.${pkgs.system}.beta
  ];
}

