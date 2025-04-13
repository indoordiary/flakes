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
        theme = pkgs.catppuccin-grub.override{
          flavor = "mocha";
        };
        extraConfig = ''
          GRUB_GFXMODE=1024x768
          GRUB_GFXPAYLOAD_LINUX=keep
        '';
     };
  };
}
