{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./foot.nix
    ./kitty.nix
    ./alacritty/default.nix
  ];
}
