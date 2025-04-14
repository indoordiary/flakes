 { config, pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-rime fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki
      ];
      waylandFrontend = true;
    };
  };
}
