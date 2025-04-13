{ config, lib, pkgs, ... }:

let
  # 定义光标主题变量
  cursorName = "Bibata-Modern-Classic-Hyprcursor";
  cursorSize = toString config.home.pointerCursor.size;

  # 颜色变量定义 (需在外部定义或替换为实际值)
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
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      # 主键位定义
      "$mainMod" = "SUPER";
      "$altMod" = "ALT";

      # 环境变量
      env = [
        "HYPRCURSOR_THEME,${cursorName}"  # 修正拼写错误
        "HYPRCURSOR_SIZE,${cursorSize}"
      ];

      # 启动脚本
      exec-once = [
        "fcitx5"  # 输入法
        "mako"    # 通知系统
        "waybar"  # 状态栏
        "hyprctl setcursor ${cursorName} ${cursorSize}"
        # "wl-paste --type text --watch cliphist store"
        # "wl-paste --type image --watch cliphist store"
      ];

      # 通用设置
      general = {
        layout = "master";
        resize_on_border = true;
        border_size = 2;
        gaps_out = 6;
        gaps_in = 3;
        "col.active_border" = "0xee${colors.lavenderAlpha} 0xee${colors.accentAlpha} 45deg";
        "col.inactive_border" = "0xaa${colors.overlay0Alpha} 0xaa${colors.mantleAlpha} 45deg";
      };

      # 装饰效果
      decoration = {
        rounding = 16;

        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;  # 修正科学计数法
          passes = 4;
          size = 7;
          popups = true;
          popups_ignorealpha = 0.2;
        };

        shadow = {
          enabled = true;
          color = "rgba(00000055)";
          ignore_window = true;
          offset = "0 15";
          range = 100;
          render_power = 2;
          scale = 0.97;
        };
      };

      # 动画配置
      animations = {
        enabled = true;
        bezier = [
          "wind,0.05,0.9,0.1,1.05"
          "winIn,0.1,1.1,0.1,1.1"
          "winOut,0.3,-0.3,0,1"
          "liner,1,1,1,1"
        ];

        animation = [
          "border,1,1,liner"
          "borderangle,1,30,liner,loop"
          "fade,1,10,default"
          "windows,1,6,wind,slide"
          "windowsIn,1,6,winIn,slide"
          "windowsOut,1,5,winOut,slide"
          "windowsMove,1,5,wind,slide"
          "workspaces,1,5,wind"
        ];
      };

      # 输入设备配置
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        mouse_refocus = false;
        accel_profile = "flat";
        sensitivity = 0;

        touchpad = {
          natural_scroll = "yes";
        };
      };

      # 布局引擎配置
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        new_on_top = true;
      };

      # 杂项设置
      misc = {
        vrr = 1;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      # 手势配置
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        workspace_swipe_fingers = 3;
      };

      # XWayland 配置
      xwayland.force_zero_scaling = true;

      # 调试设置
      debug.disable_logs = false;
    };

    # 额外配置
    extraConfig = ''
      # 窗口分组样式
      group {
        groupbar {
          render_titles = false
          height = 1
          col.active = "${colors.mauve}"
          col.inactive = "${colors.surface0}"
        }
        col.border_active = "${colors.flamingo}"
        col.border_inactive = "${colors.surface0}"
      }

      # 渲染设置
      render {
        direct_scanout = true
      }
    '';
  };

  # 依赖包声明
  home.packages = with pkgs; [
    bibata-cursors  # 确保光标主题存在
    fcitx5
    mako
    waybar
    cliphist
  ];
}
