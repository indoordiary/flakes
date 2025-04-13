{ ... }:

{
  imports = [
    ./input/fcitx5/default.nix
  ];
  environment.systemPackages = with pkgs; [
    catppuccin waybar mako
  ];
}
