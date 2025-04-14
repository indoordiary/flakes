{ config, pkgs, lib, ... }:
{

  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    opengl = {
      enable = true;
      driSupport32Bit = true;
    };

    amdgpu = {
      amdvlk.enable = true;
      initrd.enable = true;
      opencl.enable = true;
    };

    cpu.amd.updateMicrocode = true;

    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

}
