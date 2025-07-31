{
  programs.nvf.settings.vim = {
    session = {
      nvim-session-manager = {
        enable = true;
        setupOpts = {
          autoload_mode = "CurrentDir";
          autosave_only_in_session = true;
        };
      };
    };
  };
}
