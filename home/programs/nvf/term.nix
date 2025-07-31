{
  programs.nvf.settings.vim = {
    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
        setupOpts = {
          direction = "float";
        };
      };
    };

    keymaps = [
      {
        key = "<esc>";
        mode = ["t"];
        action = "<cmd>ToggleTerm<CR>";
        silent = true;
        desc = "Close floating terminal";
      }
    ];
  };
}
