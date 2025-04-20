{ pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/home/matt";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # Terminal
    alacritty
    fontconfig
    htop
    nvtopPackages.amd
    tmux
    wl-clipboard
    yadm

    # Fonts
    nerd-fonts.hack
    noto-fonts-color-emoji

    # Desktop
    avizo
    blueberry
    brightnessctl
    clipse
    dunst
    fuzzel
    grim
    hyfetch
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent
    hyprshade
    nautilus
    nautilus-python
    pamixer
    slurp
    swappy
    waybar
    wlogout
    wluma

    # Programming
    cargo
    ccls
    gcc
    git
    go
    neovim
    python313
    rustc
    unzip
    zig

    # Other
    acpi
    fwupd
    podman
    podman-tui
    virt-manager

    # Apps
    audacity
    blender-hip
    darktable
    freecad-wayland
    gearlever
    gimp
    # godot
    libreoffice-qt6-fresh
    mpv
    nextcloud-client
    openscad
    wireshark
  ];

  services = {
    udiskie.enable = true;
    gpg-agent = {
      enable = true;
      extraConfig = # ini
        ''
          allow-preset-passphrase
        '';
    };
  };

  home.file = {
    ".pam-gnupg".text = "4A1F4D5072B3E27F43E8C3A90A81B58A7DE09717";
  };

  home.sessionVariables = {
    EDITOR = "nvim`";
  };

  programs.home-manager.enable = true;
}
