{ config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./config/boot.nix
      ./config/fonts.nix
      ./config/hardware.nix
      ./config/i18n.nix
      ./config/services.nix
      ./config/security.nix
      ./config/swap.nix
      ./virtualisation.nix
    ];
  
  optional = {
    
    podman = false;

    zram = fals;
    swapDevices = true;
    hibernate =true;

    };

  networking.hostName = "ChenHsi-Laptop";
  
  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "25.05";
  };
} 