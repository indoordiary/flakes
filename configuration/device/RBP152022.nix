{ config, lib, pkgs, ... }:
{
  # Graphic Card
  boot.extraModprobeConfig = ''
      options amdgpu si_support=1
      options amdgpu cik_support=1
      options kvm_amd nested=1
      blacklist radeon
    '';

  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        mesa
        vulkan-loader
        libva
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ mesa vulkan-loader ];
    };
}
