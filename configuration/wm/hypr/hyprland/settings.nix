# ~/.config/hyprland/settings.nix
{ config, lib, pkgs, ... }:

let
  cursorName = "Bibata-Modern-Classic-Hyprcursor";
  cursorSize = toString config.home.pointerCursor.size;
  
  colors = {
    lavenderAlpha = "d3e4c9ff";
    accentAlpha = "598da8ff";
    overlay0Alpha = "2222227f";
    mantleAlpha = "2222223f";
    mauve = "c5a7e7";
    surface0 = "45475a";
    flamingo = "f2cdcd";
  };
in
{
  wayland.windowManager.hyprland.settings = lib.mkMerge [
    {
      # 基础配置
      monitor = [
        "DP-1, 2560x1440@144, 0x0, 1.25"
        "eDP-1, 1920x1080@60, 2560x0, 1.0"
      ];

      env = [
        "HYPRCURSOR_THEME,${cursorName}"
        "HYPRCURSOR_SIZE,${cursorSize}"
      ];

      exec-once = [
        "fcitx5"
        "mako"
        "waybar"
        "hyprctl setcursor ${cursorName} ${cursorSize}"
      ];

      # 使用 mkDefault 保持可覆盖性
      general = lib.mkDefault {
        layout = "master";
        resize_on_border = true;
        border_size = 2;
        gaps_in = 3;
        gaps_out = 8;
        "col.active_border" = "0xee${colors.lavenderAlpha} 0xee${colors.accentAlpha} 45deg";
        "col.inactive_border" = "0xaa${colors.overlay0Alpha} 0xaa${colors.mantleAlpha} 45deg";
      };
    }
  ];
}
