{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
    settings = {
      # 正确导入主题文件（需确保文件存在）
      import = [ ./catppuccin-mocha.toml ];

      window = {
        opacity = 0.93;
        startup_mode = "Maximized";
        dynamic_title = true;
        option_as_alt = "Both";  # 修正：字符串用双引号
      };

      scrolling.history = 10000;

      font = {
        normal.family = "JetBrainsMono Nerd Font";
      };

      # 修正 shell 配置结构
      shell = {
        program = "${pkgs.bash}/bin/bash";
        args = [ "--login" "-c" "nu --login --interactive" ];
      };

      # OSC 52 剪贴板支持
      terminal.osc52 = "CopyPaste";
    };
  };
}
