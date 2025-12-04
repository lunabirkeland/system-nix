{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "lunabirkeland";
        email = "lunabirkeland@gmail.com";
      };
      core = {
        editor = "nvim";
      };
    };
  };
}
