{ pkgs, inputs, ... }:
{
  imports = [
    ../wm/theme/default.nix
  ];

  home.packages = with pkgs; [

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

