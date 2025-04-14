{ config, ... }:

{
  imports = [
    # ./sudo.nix
    ./doas.nix
    ./grub.nix
    ./plymouth.nix
    ./gnupg.nix
    ./flatpak.nix
    # ./steam.nix
    ./proxy.nix
    ./tlp.nix
    ./firefox.nix
    ./install-system.nix
    ./others.nix
    ./virtualisation.nix
    ./terminal/fish.nix
  ];
  
  nixpkgs.config.permittedInsecurePackages = [

  ];

}
