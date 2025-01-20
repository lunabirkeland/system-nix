{
  inputs,
  pkgs,
  vars,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      git
      linuxPackages_latest.perf
      neovim
      curl
      wget
      file
      which
      tree
      sbctl
    ];
    shells = with pkgs; [zsh];
    # allows completion for system packages
    pathsToLink = ["/share/zsh"];
    # for security reasons, do not load neovim's user config
    # since EDITOR may be used to edit some critical files
    variables.EDITOR = "nvim --clean";
  };

  # enable opengl
  hardware.graphics.enable = true;

  services.seatd.enable = true;

  # allows pipewire to gain realtime priority
  security.rtkit.enable = true;

  programs.zsh.enable = true;
  programs.adb.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.${vars.username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "wireshark" "dialout" "adbusers"];
    };
  };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      builders-use-substitutes = true;
      # Use cached hyprland builds to avoid rebuidling
      substituters = [
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
  };
}
