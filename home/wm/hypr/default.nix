{ lib, config, pkgs,... }:

{
  imports = [
    ./values/packages.nix
    ./values/anyrun.nix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland";
  };

  extraConfig = builtins.readFile ./conf/hyprland.conf;    

  xsession.enable = true;
  xsession.windowManager.hyprland.enable =true;

  xdg.configFile = {
    "hypr/mako" = {
      source = ./conf/mako;
      recursive = true;
    };
    "hypr/scripts" = {
      source = ./conf/scripts;
      recursive = true;
    };
    "hypr/waybar" = {
      source = ./conf/waybar;
      recursive = true;
    };
    "hypr/wlogout" = {
      source = ./conf/wlogout;
      recursive = true;
    };

    # music player - mpd
    "mpd" = {
      source = ./conf/mpd;
      recursive = true;
    };
  };
}
