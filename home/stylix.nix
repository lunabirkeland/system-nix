{
  lib,
  pkgs,
  ...
}: {
  # stylix cursor not working well
  home.pointerCursor = lib.mkForce {
    name = "graphite-dark";
    package = pkgs.graphite-cursors;
    size = 32;
    x11.enable = true;
    gtk.enable = true;
  };
}
