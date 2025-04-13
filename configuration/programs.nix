{ config, ... }:

{
  imports = [
    # ./programs/sudo.nix
    ./programs/doas.nix
    ./programs/fish.nix
    ./programs/grub.nix
    ./programs/nix.nix
    ./programs/plymouth.nix
    ./programs/gnupg.nix
    ./programs/flatpak.nix
    # ./programs/steam.nix
    ./programs/proxy.nix
    ./programs/tlp.nix
    ./programs/firefox.nix
    ./programs/install-system.nix
    ./programs/others.nix
    ./programs/virtualisation.nix
  ];

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  services.xserver.displayManager.gdm.enable = true; 


  nixpkgs.config.permittedInsecurePackages = [

  ];

}
