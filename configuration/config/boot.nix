{ config, lib, pkgs, ... }:
{
  boot = {
    enableContainers = false;

    kernelPackages = pkgs.linuxPackages_xanmod;
    
    kernelParams = [ "amd_pstate=active" ];

    loader = {
      systemd-boot = {
        enable = false;
        configurationLimit = 10;
      };
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };

    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };
}
