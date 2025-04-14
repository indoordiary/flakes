{ config, lib, ... }:
{
  programs = {
    command-not-found.enable = true;
    dconf.enable = true;
    adb.enable = true;
    git.enable = true;

    coolercontrol.enable = true;  # 风扇控制
    gamemode.enable = true;  # gamemoderun <game>
    wshowkeys.enable = false;  # 显示键盘按键

    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  virtualisation.waydroid.enable = true;

  documentation.nixos.enable = false;
}
