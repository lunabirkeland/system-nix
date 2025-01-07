{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/base.nix
    ../../modules/gnome.nix
    ../../modules/localisation.nix
    ../../modules/networking.nix
    ../../modules/nix-ld.nix
    ../../modules/peripherals.nix
    ../../modules/stylix.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    # switch to latest kernel for bluetooth issues fixed in 6.9.6
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  networking.hostName = "caudatus";

  # enable fingerprint reader support
  services.fprintd = {
    enable = true;
  };

  # enable firmware update daemon
  services.fwupd.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11";
}
