# ~/.config/hyprland/binds.nix
{ config, lib, pkgs, ... }:

let
  mainMod = "SUPER";
  altMod = "ALT";
  
  terminal = "${pkgs.fish}/bin/fish";
  editor = "${pkgs.neovide}/bin/neovide";
  browser = "${pkgs.firefox}/bin/firefox";

  # 修正工作区绑定生成方式
  workspaces = builtins.concatLists (
    builtins.genList 
      (x: [
        "${altMod}, ${toString (x+1)}, workspace, ${toString (x+1)}"
        "${altMod} SHIFT, ${toString (x+1)}, movetoworkspace, ${toString (x+1)}"
      ])
      10
  );
in
{
  wayland.windowManager.hyprland.settings = {
    bind = lib.mkForce ([
      # 系统命令
      "${mainMod} SHIFT, E, exit",
      "${mainMod}, Q, killactive",
      "${mainMod}, T, togglefloating",
      "${mainMod}, F, fullscreen",

      # 应用程序
      "${mainMod}, Return, exec, ${terminal}",
      "${mainMod}, D, exec, ${editor}",
      "${mainMod}, B, exec, ${browser}",
      "${mainMod}, E, exec, ${pkgs.nautilus}/bin/nautilus",

      # 工作区导航
      "${altMod}, period, workspace, e+1",
      "${altMod}, comma, workspace, e-1",

      # 实用工具
      "${mainMod}, L, exec, ${pkgs.hyprlock}/bin/hyprlock",
      "${mainMod}, Z, exec, ${pkgs.grimblast}/bin/grimblast --notify copysave area"
    ] ++ workspaces);  # 正确合并列表

    bindel = [
      ", XF86MonBrightnessUp, exec, light -A 5",
      ", XF86MonBrightnessDown, exec, light -U 5"
    ];
  };
}
