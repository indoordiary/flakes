{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.chenhsi = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "video" "docker" ];
      useDefaultShell = true;
      initialPassword = "FFFF";
    };
  };

  security.pam.services.chenhsi.gnupg.enable = true;
}
