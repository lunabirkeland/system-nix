{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "lunabirkeland";
    userEmail = "lunabirkeland@gmail.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };
}
