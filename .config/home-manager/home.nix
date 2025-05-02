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
        hyprsunset
        nautilus
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
        rustc
        unzip
        zig

        poetry
        (python313.withPackages (ppkgs: [
            ppkgs.pip
            ppkgs.virtualenv
            ppkgs.pyserial
            ppkgs.psutil
        ]))

        # Other
        acpi
        fwupd
        podman-tui
        virt-manager
        dig

        # Apps
        android-tools
        appimage-run
        audacity
        baobab
        blender-hip
        darktable
        exiftool
        freecad-wayland
        gearlever
        gimp
        imv
        kicad
        # godot
        libreoffice-qt6-fresh
        mpv
        nextcloud-client
        openscad
        picocom
        povray
        qalculate-gtk
        spotify-player
        squirreldisk
        usbutils
        webcamoid
        wireshark
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    ];

    programs = {
        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
    };

    services = {
        udiskie.enable = true;
        gpg-agent = {
            enable = true;
            extraConfig = # ini
                ''
                allow-preset-passphrase
                '';
        };
        podman.enable = true;
    };

    home.file = {
        ".pam-gnupg".text = ''
        4A1F4D5072B3E27F43E8C3A90A81B58A7DE09717
        51156E65A53A876FB44094E0548229EA36D2876B
        '';
    };

    home.sessionVariables = {
        EDITOR = "nvim`";
    };

    programs.home-manager.enable = true;
}
