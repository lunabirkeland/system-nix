# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = ["firefox.desktop" "org.gnome.Terminal.desktop"];
      enabled-extensions = ["user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "appindicatorsupport@rgcjonas.gmail.com"];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      custom-theme-shrink = false;
      dash-max-icon-size = 40;
      dock-position = "LEFT";
      extend-height = false;
      height-fraction = 0.9;
      hot-keys = false;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      show-mounts = false;
      show-show-apps-button = false;
      show-trash = false;
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "95894cfd-82f7-430d-af6e-84d168bc34f5";
      list = ["95894cfd-82f7-430d-af6e-84d168bc34f5"];
    };

    "org/gnome/terminal/legacy/profiles:/:95894cfd-82f7-430d-af6e-84d168bc34f5" = {
      background-color = "#000000";
      cursor-background-color = "#f5e0dc";
      cursor-colors-set = true;
      cursor-foreground-color = "#000000";
      foreground-color = "#cdd6f4";
      highlight-background-color = "#000000";
      highlight-colors-set = true;
      highlight-foreground-color = "#585b70";
      palette = ["#45475a" "#f38ba8" "#a6e3a1" "#f9e2af" "#89b4fa" "#f5c2e7" "#94e2d5" "#bac2de" "#585b70" "#f38ba8" "#a6e3a1" "#f9e2af" "#89b4fa" "#f5c2e7" "#94e2d5" "#a6adc8"];
      scrollbar-policy = "never";
      use-theme-colors = false;
      visible-name = "Catppuccin Mocha";
    };
  };
}
