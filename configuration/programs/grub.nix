{ config, ... }:
{
  boot.loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        configurationName = "NixOS";
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
  };
}
