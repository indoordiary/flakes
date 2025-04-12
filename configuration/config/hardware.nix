{ config, pkgs, lib, ... }:
{

  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu = {
      amdvlk.enable = true;
      initrd.enable = true;
      opencl.enable = true;
    };

    cpu.amd.updateMicrocode = true;
  };

  enableAllFirmware = true;
  enableRedistributableFirmware = true;

  services.blueman.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

}
