{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    plymouth.enable = true;
    initrd.systemd.enable = true;
    supportedFilesystems = [ "nfs" ]; # Get the nfs kernel module loaded
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    hostName = "matt-laptop";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    # support SSDP https://serverfault.com/a/911286/9166
    firewall = {
      extraPackages = [ pkgs.ipset ];
      extraCommands = ''
        if ! ipset --quiet list upnp; then
          ipset create upnp hash:ip,port timeout 3
        fi
        iptables -A OUTPUT -d 239.255.255.250/32 -p udp -m udp --dport 1900 -j SET --add-set upnp src,src --exist
        iptables -A nixos-fw -p udp -m set --match-set upnp dst,dst -j nixos-fw-accept
      '';
    };
  };

  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  console.keyMap = "uk";

  users.users.matt = {
    isNormalUser = true;
    description = "Matt";
    extraGroups = [
      "dialout"
      "libvirtd"
      "mlocate"
      "networkmanager"
      "podman"
      "wheel"
      "wireshark"
    ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    nix-ld.enable = true;
    zsh.enable = true;
    wireshark.enable = true;
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "matt" ];
    };
    gnupg.agent = {
       enable = true;
       pinentryPackage = pkgs.pinentry-gnome3;
       enableSSHSupport = true;
    };
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      clinfo
      fprintd
      fuse
      fuse3
      gnupg
      libepoxy
      libsecret
      openvpn
      pam_gnupg
      pass
      pkg-config
      powertop
      qemu_kvm
      vim
      virtiofsd
      vivaldi
    ];

    etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          vivaldi-bin
        '';
        mode = "0755";
      };
    };
  };

  services = {
    blueman.enable = true;
    fprintd.enable = true;
    fwupd.enable = true;
    openssh.enable = true;
    passSecretService.enable = true;
    pcscd.enable = true;
    power-profiles-daemon.enable = true;
    printing.enable = true;
    rpcbind.enable = true; # needed for NFS
    udisks2.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    logind = {
      powerKey = "suspend-then-hibernate";
      lidSwitch = "suspend-then-hibernate";
    };

    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    locate = {
      enable = true;
      package = pkgs.mlocate;
      interval = "hourly";
    };

    udev = {
      extraRules = ''
        SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
        SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", ATTR{idProduct}=="2e81", GROUP="wheel"
      '';
    };

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];

      displayManager.lightdm = {
        enable = true;
      };

      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics.extraPackages = with pkgs; [
      amdvlk
      rocmPackages.clr.icd
    ];
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
    podman.enable = true;
  };

  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;

    pam.services = {
      login = {
        fprintAuth = false;

        gnupg = {
          enable = true;
          noAutostart = true;
        };
      };

      systemd-user.gnupg = {
        enable = true;
        noAutostart = true;
      };
    };
  };

  systemd = {
    mounts = [{
      type = "nfs";
      mountConfig = {
        Options = "noatime";
      };
      what = "server:/data";
      where = "/mnt/data";
    }];
    automounts = [{
      wantedBy = [ "multi-user.target" ];
      automountConfig = {
        TimeoutIdleSec = "600";
      };
      where = "/mnt/data";
    }];
  };

  powerManagement.powertop.enable = true;

  system.stateVersion = "24.11";
}
