{
  programs.nvf.settings.vim = {
    lsp = {
      lspconfig.enable = true;
      formatOnSave = true;
      lspkind.enable = true;
      trouble.enable = true;
    };

    languages = {
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      java.enable = true;
      kotlin.enable = true;
      ts.enable = true;
      go.enable = true;
      lua.enable = true;
      zig.enable = true;
      python.enable = true;
      typst.enable = true;
      rust = {
        enable = true;
        crates.enable = true;
      };
      wgsl = {
        enable = true;
        lsp.enable = false;
      };
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };
  };
}
