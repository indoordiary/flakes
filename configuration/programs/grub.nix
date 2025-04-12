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
          flavors ={
            light ="latte";
            dark= "mocha";
          };
        };
     };
  };
}
