{ pkgs, inputs, ... }:
{
  imports = [
  ];

  home.packages = with pkgs; [
    # Utils
    mihomo-party networkmanagerapplet btop killall

    # File Manager
    yazi thunar

    # Media
    mpv bilibili

    # Music
    qqmusic yesplaymusic

    # Social
    qq wechat-uos telegram-desktop 

    # Editor
    typora zed-editor Neovim

    # Develop
    vscode-fhs 
    
    # inpus
    inputs.zen-browser.packages."${system}".beta
  ];
}

