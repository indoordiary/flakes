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

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  services.xserver.displayManager.gdm.enable = true;  

  documentation.nixos.enable = false;
}
