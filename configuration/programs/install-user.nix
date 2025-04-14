{ pkgs, inputs, ... }:
{
  imports = [
   ../wm/gtk.nix
  ];

  home.packages = with pkgs; [
    #Utils
    mihomo-party networkmanagerapplet 

    # Social 
    qq wechat-uos telegram-desktop 

    # dev
    vscode-fhs typora zed-editor

    # Entertainment
    bilibili qqmusic yesplaymusic

    # inpus
    inputs.zen-browser.packages."${system}".beta
  ];
}

