{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5ct
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    waybar # the status bar
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker
    
    pkgs.hyprshot # screen shot
    grim # taking screenshots
    slurp # selecting a region to screenshot
    wf-recorder # screen recording

    mako # notification

    anyrun # apps menu 

    yad # a fork of zenity, for creating dialogs

    # audio
    alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
  ];
}
