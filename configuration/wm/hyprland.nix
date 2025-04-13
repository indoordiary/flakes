{ pkgs, config, ... }:

{
  imports = [
    ./input/fcitx5/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # Cursor and UI themes
    catppuccin-cursors

    # Wayland utilities
    waybar wofi wlogout hyprpaper hyprlock hyprcursor
    networkmanagerapplet uwsm hyprpolkitagent xdg-desktop-portal-hyprland

    # Terminal and notifications
    kitty dunst

    # System utilities
    brightnessctl pavucontrol pipewire pipewire.pulse pipewire.alsa wireplumber

    # Hyprland-specific tools
    hyprpaper hyprlock hyprpicker grim slurp wofi cliphist

    # File management
    xfce.thunar gvfs

    # GTK and GNOME utilities
    gtk4 seahorse gnome.gnome-keyring

    # Qt support
    libsForQt5.qt5ct qt6.qtwayland libsForQt5.qtwayland

    # Desktop portals
    xdg-desktop-portal-gtk
  ];
}
