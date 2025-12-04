{pkgs, ...}: {
  # enable user fonts
  fonts.fontconfig.enable = true;

  programs = {
    gpg.enable = true;

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      initContent = "eval \"$(direnv hook zsh)\"\n";
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    starship = {
      enable = true;
      # custom settings
      enableZshIntegration = true;
      settings = {
        add_newline = true;
        aws.disabled = true;
        gcloud.disabled = true;
      };
    };

    mpv = {
      enable = true;
      config = {
        vo = "gpu-next";
        target-colorspace-hint = true;
        gpu-api = "vulkan";
        gpu-context = "waylandvk";
      };
    };
  };

  home.packages = with pkgs; [
    wget
    curl
    git
    fd
    ripgrep
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    gcc
    nerd-fonts.symbols-only
    foliate
    hunspell
    hunspellDicts.nb-no
    hunspellDicts.en-gb-large
    pkgs.unstable.bitwarden-desktop
  ];

  services.easyeffects.enable = true;

  xdg.configFile."com.github.johnfactotum.Foliate/themes.json".source =
    pkgs.fetchFromGitHub
    {
      owner = "catppuccin";
      repo = "foliate";
      rev = "ffca991";
      sha256 = "4Rt9elZLGuZjSgYsbIaN9u7mxUDfJi3ayIBd0KwF58g=";
    }
    + /themes.json;
}
