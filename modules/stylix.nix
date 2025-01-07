{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;
    image = ../wallpaper.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    override.base00 = "#000000";
    override.base01 = "#000000";

    cursor = {
      name = "graphite-dark";
      package = pkgs.graphite-cursors;
      size = 32;
    };
  };
}
