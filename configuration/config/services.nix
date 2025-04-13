{ config, lib, pkgs, ... }:
{
  services = {
    pipewire = lib.mkForce {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };
    pulseaudio.enable = false;

    fstrim = {
      enable = true;
      interval = "weekly";
    };

    logind = {
      extraConfig = ''
        HandlePowerKey=suspend  # 短按休眠
        HandlePowerKeyLongPress=poweroff  #长按关机
      '';
      lidSwitch = "suspend";  # 合盖休眠
};


    dbus.apparmor = "enabled";
    xserver.excludePackages = [ pkgs.xterm ];

    thermald.enable = true;
  };
}
