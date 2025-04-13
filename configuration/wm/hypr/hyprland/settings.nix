# ~/.config/hyprland/settings.nix
{ config, lib, pkgs, ... }:

let
  cursorName = "Bibata-Modern-Classic-Hyprcursor";
  cursorSize = toString config.home.pointerCursor.size;
  
  colors = rec {
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
      # 基础配置 (默认优先级)
      monitor = lib.mkDefault [
        "DP-1, 2560x1440@144, 0x0, 1.25"
        "eDP-1, 1920x1080@60, 2560x0, 1.0"
      ];

      env = lib.mkDefault [
        "HYPRCURSOR_THEME,${cursorName}"
        "HYPRCURSOR_SIZE,${cursorSize}"
      ];

      exec-once = lib.mkDefault [
        "fcitx5"
        "mako"
        "waybar"
        "hyprctl setcursor ${cursorName} ${cursorSize}"
      ];

      # 默认布局参数 (可被覆盖)
      general = lib.mkDefault {
        layout = "master";
        resize_on_border = true;
        gaps_in = 3;    # 默认值
        gaps_out = 8;    # 默认值
        border_size = 2;
        "col.active_border" = "0xee${colors.lavenderAlpha} 0xee${colors.accentAlpha} 45deg";
        "col.inactive_border" = "0xaa${colors.overlay0Alpha} 0xaa${colors.mantleAlpha} 45deg";
      };

      # 装饰效果 (不可覆盖)
      decoration = {
        rounding = 16;
        blur = {
          enabled = true;
          size = 7;
          passes = 4;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;
        };
        shadow = {
          enabled = true;
          color = "rgba(00000055)";
          offset = "0 15";
          range = 100;
        };
      };

      # 动画配置
      animations = lib.mkDefault {
        enabled = true;
        bezier = [ /* ... */ ];
        animation = [ /* ... */ ];
      };

      # 输入设备配置
      input = lib.mkDefault {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = "yes";
      };
    }
  ];

  # 依赖包声明
  home.packages = with pkgs; [
    bibata-cursors
    fcitx5
    mako
    waybar
  ];
}
