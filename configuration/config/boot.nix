{ config, lib, pkgs, ... }:
{
  boot = {
    enableContainers = false;

    kernelPackages = pkgs.linuxPackages_xanmod;

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

    kernelParams = [ "amd_pstate=active" ];

    tmp = {
      useTmpfs = false;
      cleanOnBoot = true;
    };
  };
}
