{
  lib,
  pkgs,
  ...
}: {
  # stylix cursor not working well
  home.pointerCursor = lib.mkForce {
    name = "BreezeX-RoséPine";
    package = pkgs.rose-pine-cursor;
    size = 32;
    x11.enable = true;
    gtk.enable = true;
  };
}
