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
}
