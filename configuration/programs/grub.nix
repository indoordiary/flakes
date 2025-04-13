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
<<<<<<< HEAD
        gfxmodeEfi = "1024x768";
=======
        extraConfig = ''
          GRUB_GFXMODE=1024x768
          GRUB_GFXPAYLOAD_LINUX=keep
        '';
>>>>>>> 0db983b3e2afd7f507b7af04bce32ebda9215f3b
     };
  };
}
