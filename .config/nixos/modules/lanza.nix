{pkgs, lib, ... }:

let
  luksCryptenroller = pkgs.writeTextFile {
    name = "luksCryptenroller";
    destination = "/bin/luksCryptenroller";
    executable = true;

    text = let
      luksDevice01 = "NIXLUKS";
    in ''
      sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=0+7 /dev/disk/by-label/${luksDevice01}
    '';
  };
in
{
  environment.systemPackages = [
    luksCryptenroller
    pkgs.sbctl
    pkgs.tpm2-tss
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
