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

    blueman.enable = true;

    pulseaudio.enable = false;

    xserver.displayManager.gdm.enable = true; 

    fstrim = {
      enable = true;
      interval = "weekly";
    };

    logind = {
      extraConfig = ''
        HandlePowerKey=suspend  # 短按休眠
        HandlePowerKeyLongPress=poweroff  # 长按关机
        HandleLidSwitch=hibernate  #合盖休眠
        HandleLidSwitchExternalPower=hibernate  # 电源接通时合盖仍然休眠
        HandleLidSwitchDocked=ignore  # 连接拓展坞时忽略盖子开关事件
        HibernateKeyIgnoreInhibited=no  #休眠键守护
      '';
};


    dbus.apparmor = "enabled";
    xserver.excludePackages = [ pkgs.xterm ];
  };
}
