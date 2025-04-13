# ~/.config/hyprland/binds.nix
{ config, lib, pkgs, ... }:

let
  mainMod = "SUPER";
  altMod = "ALT";
  
  # 应用程序路径定义
  terminal = "${pkgs.fish}/bin/fish";
  editor = "${pkgs.neovide}/bin/neovide";
  browser = "${pkgs.firefox}/bin/firefox";

  # 自动生成工作区绑定 (使用 lib.mkForce 确保最高优先级)
  workspaces = lib.mkForce (builtins.concatLists (
    builtins.genList (
      x: let ws = builtins.toString (x + 1); in [
        "${altMod}, ${ws}, workspace, ${toString (x + 1)}"
        "${altMod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    ) 10
  ));
in
{
  wayland.windowManager.hyprland.settings = lib.mkMerge [
    {
      # 强制覆盖的配置项
      general = lib.mkForce {
        gaps_in = 5;    # 强制设为5
        gaps_out = 10;  # 强制设为10
        border_size = 2;
      };

      # 快捷键绑定 (最高优先级)
      bindm = lib.mkForce [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      bind = lib.mkForce ([
        # 系统命令
        "${mainMod} SHIFT, E, exit"
        "${mainMod}, Q, killactive"
        "${mainMod}, T, togglefloating"
        "${mainMod}, F, fullscreen"

        # 应用程序
        "${mainMod}, Return, exec, ${terminal}"
        "${mainMod}, D, exec, ${editor}"
        "${mainMod}, B, exec, ${browser}"
        "${mainMod}, E, exec, ${pkgs.nautilus}/bin/nautilus"

        # 工作区导航
        "${altMod}, period, workspace, e+1"
        "${altMod}, comma, workspace, e-1"

        # 实用工具
        "${mainMod}, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "${mainMod}, Z, exec, ${pkgs.grimblast}/bin/grimblast --notify copysave area"
      ] ++ workspaces);

      bindel = lib.mkForce [
        ", XF86MonBrightnessUp, exec, light -A 5"
        ", XF86MonBrightnessDown, exec, light -U 5"
      ];
    }
  ];
}
