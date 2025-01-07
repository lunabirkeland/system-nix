{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";

      package = pkgs.papirus-icon-theme;
    };
  };
}
