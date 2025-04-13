{ config, pkgs, ... }:

let
  #定义程度按键
  altMod = "SUPER";
  mainMod ="ALT";
  # 应用程序路径定义
  terminal = "${pkgs.fish}/bin/fish";  # 使用 fish shell 作为终端
  editor = "${pkgs.neovide}/bin/neovide";
  browser = "${pkgs.firefox}/bin/firefox";
  
  # 自动生成工作区绑定 (1-10)
  workspaces = builtins.concatLists (
    builtins.genList (
      x:
      let
        ws = builtins.toString (x + 1);
      in
      [
        "${altMod}, ${ws}, workspace, ${toString (x + 1)}"
        "${altMod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    ) 10
  );
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    
    # 必须安装的系统包
    systemd.enable = true;

    settings = {
      # 显示器配置 (需根据实际接口修改)
      monitor = [
        "DP-1, 2560x1440@144, 0x0, 1.25"
        "eDP-1, 1920x1080@60, 2560x0, 1.0"
      ];

      # 窗口布局配置
      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      # 快捷键绑定
      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      bind = [
        # 系统命令
        "${mainMod} SHIFT, E, exit"  # 退出 Hyprland
        "${mainMod}, Q, killactive"  # 关闭活动窗口
        "${mainMod}, T, togglefloating"  # 切换浮动窗口
        "${mainMod}, F, fullscreen"  # 全屏

        # 应用程序启动
        "${mainMod}, Return, exec, ${terminal}"  # 终端
        "${mainMod}, D, exec, ${editor}"         # 编辑器
        "${mainMod}, B, exec, ${browser}"        # 浏览器
        "${mainMod}, E, exec, ${pkgs.nautilus}/bin/nautilus"  # 文件管理器

        # 工作区操作
        "${altMod}, period, workspace, e+1"  # 下一个工作区
        "${altMod}, comma, workspace, e-1"   # 上一个工作区

        # 特殊操作
        "${mainMod}, L, exec, ${pkgs.hyprlock}/bin/hyprlock"  # 锁屏
        "${mainMod}, Z, exec, ${pkgs.grimblast}/bin/grimblast --notify copysave area"  # 截图
      ] ++ workspaces;  # 合并自动生成的工作区绑定

      # 窗口布局控制
      bindel = [
        ", XF86MonBrightnessUp, exec, light -A 5"   # 亮度增加
        ", XF86MonBrightnessDown, exec, light -U 5" # 亮度减少
      ];
    };

    # 额外配置 (窗口调整子映射)
    extraConfig = ''
      # 窗口调整模式
      bind = ${altMod}, R, submap, resize
      submap = resize
        binde = , L, resizeactive, 10 0
        binde = , H, resizeactive, -10 0
        binde = , K, resizeactive, 0 -10
        binde = , J, resizeactive, 0 10
        bind = , escape, submap, reset
      submap = reset
    '';
  };

  # 确保依赖包安装
  home.packages = with pkgs; [
    fish         # 终端 shell
    neovide      # Neovim GUI
    firefox      # 浏览器
    nautilus     # 文件管理器
    hyprlock     # 锁屏工具
    grimblast    # 截图工具
    light        # 背光控制
  ];
}
