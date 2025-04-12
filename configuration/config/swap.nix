{ config, ... }:
{
  zramSwap = {
    enable = config.option.zram or false;
    priority = 100;
    swapDevices = 2;
  };

  swapDevices = lib.mkIf config.option.swapDevices [
    { device = "/dev/disk/by-uuid/69f6b62c-faaf-4c03-a15f-8c10d6af490a"; priority = 10; }
  ];

  services.logind.extraConfig = ''
    HandleLidSwitch=hibernate
    HandleLidSwitchExternalPower=hibernate
    HandleLidSwitchDocked=ignore
    HibernateKeyIgnoreInhibited=no
  '';

}
