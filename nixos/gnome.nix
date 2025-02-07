{
  config,
  pkgs,
  vars,
  ...
}: {
  # nixpkgs.overlays = [
  #   # GNOME 47: triple-buffering-v4-47
  #   (final: prev: {
  #     mutter = prev.mutter.overrideAttrs (old: {
  #       src = prev.fetchFromGitLab {
  #         domain = "gitlab.gnome.org";
  #         owner = "vanvugt";
  #         repo = "mutter";
  #         rev = "triple-buffering-v4-47";
  #         hash = "sha256-JaqJvbuIAFDKJ3y/8j/7hZ+/Eqru+Mm1d3EvjfmCcug=";
  #       };
  #       preConfigure = let
  #         gvdb-src = prev.fetchFromGitLab {
  #           domain = "gitlab.gnome.org";
  #           owner = "GNOME";
  #           repo = "gvdb";
  #           rev = "2b42fc75f09dbe1cd1057580b5782b08f2dcb400";
  #           hash = "sha256-CIdEwRbtxWCwgTb5HYHrixXi+G+qeE1APRaUeka3NWk=";
  #         };
  #       in ''
  #         cp -a "${gvdb-src}" ./subprojects/gvdb
  #       '';
  #     });
  #   })
  # ];

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
}
