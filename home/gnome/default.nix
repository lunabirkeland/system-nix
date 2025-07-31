{pkgs, ...}: {
  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs; [
    gedit
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      {package = pkgs.gnomeExtensions.tiling-shell;}
      {package = pkgs.gnomeExtensions.dash-to-dock;}
      {package = pkgs.gnomeExtensions.appindicator;}
      {package = pkgs.gnomeExtensions.gsconnect;}
      {package = pkgs.gnomeExtensions.bluetooth-battery-meter;}
    ];
  };
}
