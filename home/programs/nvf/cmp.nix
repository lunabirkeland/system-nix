{
  programs.nvf.settings.vim = {
    autocomplete.blink-cmp = {
      enable = true;
      setupOpts = {
        keymap.preset = "super-tab";
        cmdline = {
          keymap.preset = "super-tab";
          completion.list.selection = {
            preselect = false;
            auto_insert = true;
          };
        };
        completion.list.selection = {
          preselect = false;
          auto_insert = true;
        };
      };
    };
  };
}
