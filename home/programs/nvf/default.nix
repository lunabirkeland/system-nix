{
  config,
  inputs,
  pkgs,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./wgsl.nix
    ./lsp.nix
    ./cmp.nix
    ./sessions.nix
    ./term.nix
  ];

  # Extra packages required
  home.packages = with pkgs; [
    wl-clipboard
    ripgrep
  ];

  programs.nvf = {
    enable = true;

    # https://notashelf.github.io/nvf/options.html
    settings.vim = {
      viAlias = true;
      vimAlias = true;

      spellcheck = {
        enable = true;
        languages = ["en" "nb"];
      };

      theme = {
        enable = true;
        name = "base16";
        style = "dark";
      };

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      options = {
        number = true;
        relativenumber = true;
        mouse = "a";
        showmode = false;
        tabstop = 2;
        shiftwidth = 2;
      };

      visuals = {
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim = {
          enable = true;
          setupOpts.notification.window.border = "solid";
        };

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
        };
      };

      autopairs.nvim-autopairs.enable = true;
      snippets.luasnip.enable = true;

      filetree = {
        neo-tree = {
          enable = true;
        };
      };

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      telescope.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      notify = {
        nvim-notify.enable = true;
      };

      projects = {
        project-nvim.enable = false;
      };

      utility = {
        surround.enable = true;
        diffview-nvim.enable = true;
        sleuth.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = true;
        };
      };

      notes = {
        todo-comments.enable = true;
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer = {
          enable = true;
          setupOpts.filetypes = {
            "*" = {};
            javascript = {
              AARRGGBB = false;
            };
          };
        };
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        fastaction.enable = true;
      };

      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
