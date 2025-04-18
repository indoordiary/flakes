{ config, pkgs, ... }:
{
  boot.loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        configurationName = "NixOS";
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        theme = pkgs.catppuccin-grub.override { flavor = "mocha"; };
        gfxmodeEfi = "1024x768";
     };
  };
}
