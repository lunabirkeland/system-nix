{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../nixos

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

  # fix wifi issues after sleep
  # https://wiki.archlinux.org/title/Lenovo_ThinkPad_T14_(AMD)_Gen_4#Unreliable/High_latency
  networking.networkmanager.wifi.powersave = false;

  # enable fingerprint reader support
  services.fprintd = {
    enable = true;
  };

  # prevent fingerprint reader lost on suspend
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="06cb", ATTRS{idProduct}=="00f9", ATTR{power/persist}="1", RUN="${pkgs.coreutils}/bin/chmod 444 %S%p/../power/persist"
  '';

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
