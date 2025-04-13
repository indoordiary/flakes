{ pkgs, inputs, ... }:
{
  imports = [
   # ../wm/theme.nix
  ];

  home.packages = with pkgs; [
    #Utils
    typora

    # Social 
    qq wechat-uos telegram-desktop 

    # dev
    vscode-fhs

    # Entertainment
    bilibili qqmusic

    # inpus
    inputs.zen-browser.packages."${system}".beta
  ];
}

