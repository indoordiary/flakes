{ config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./fonts.nix
      ./hardware.nix
      ./nix.nix
      ./i18n.nix
      ./services.nix
      ./security.nix
      ./swap.nix
      ./network.nix
      ./user.nix
    ];

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "25.05";
  };
} 
