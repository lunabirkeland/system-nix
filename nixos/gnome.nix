{
  config,
  pkgs,
  vars,
  ...
}: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;
    # Enable the GNOME Desktop Environment.
    displayManager = {
      gdm.enable = true;
    };
    desktopManager.gnome.enable = true;
    # remove xterm
    excludePackages = [pkgs.xterm];
    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  environment.systemPackages = with pkgs; [
    gnome-terminal
    gnome-tweaks
    gnomeExtensions.appindicator
  ];

  services.udev.packages = with pkgs; [gnome-settings-daemon];

  services.displayManager.autoLogin = {
    enable = true;
    user = vars.username;
  };

  # workaround for autologin issues
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # unlock automatically gnome keyring
  security.pam.services.gdm.enableGnomeKeyring = true;

  programs.dconf.enable = true;

  # allow kdeconnect/gsconnect
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
