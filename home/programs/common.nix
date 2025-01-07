{
  config,
  pkgs,
  username,
  ...
}: {
  # enable user fonts
  fonts.fontconfig.enable = true;

  programs = {
    gpg.enable = true;

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      initExtra = "eval \"$(direnv hook zsh)\"\n";
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    firefox.enable = true;

    starship = {
      enable = true;
      # custom settings
      enableZshIntegration = true;
      settings =
        {
          add_newline = true;
          aws.disabled = true;
          gcloud.disabled = true;
          #format = "$all"; # Remove this line to disable the default prompt format
          palette = "catppuccin_mocha";
        }
        // builtins.fromTOML (builtins.readFile
          (pkgs.fetchFromGitHub
            {
              owner = "catppuccin";
              repo = "starship";
              rev = "e99ba6b";
              sha256 = "sha256-1w0TJdQP5lb9jCrCmhPlSexf0PkAlcz8GBDEsRjPRns=";
            }
            + /themes/mocha.toml));
    };
  };

  services = {
    easyeffects = {
      enable = true;
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
    noto-fonts-emoji
    gcc
    nerd-fonts.symbols-only
    foliate
    libreoffice-fresh
    hunspell
    hunspellDicts.nb-no
    hunspellDicts.en-gb-large
    proton-pass
    mpv
    element-desktop
  ];

  xdg.configFile."Element/config.json".source =
    pkgs.fetchFromGitHub
    {
      owner = "catppuccin";
      repo = "element";
      rev = "ddced94";
      sha256 = "8EP/IQW3rdtomHBfnQNIjGbiD6OapPzXPFLjziNDcmc=";
    }
    + /config.json;

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
