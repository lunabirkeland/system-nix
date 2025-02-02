{
  config,
  lib,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";

      package = pkgs.papirus-icon-theme;
    };
  };

  # stylix cursor not working well
  home.pointerCursor = lib.mkForce {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 24;

    x11.enable = true;
    gtk.enable = true;
  };
}
