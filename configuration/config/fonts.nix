{ config, pkgs, lib, ... }:
{
  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome
      sarasa-gothic
      twemoji-color-font
      inconsolata
      fira-code
      noto-fonts-cjk-sans
      nerd-fonts.symbols-only
    ];
    fontconfig.defaultFonts = {
      serif  = [ "Sarasa Gothic SC regular" ];
      sansSerif = [ "Sarasa Gothic SC regular" ];
      monospace = [ "Sarasa Mono SC" ];
      emoji = [ "Twitter Color Emoji Regular" ];
    };
  };
}
