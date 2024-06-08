# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildNeovimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.vimPlugins; [
    # plugins from nixpkgs go in here.
    alpha-nvim # A lua powered greeter like vim-startify / dashboard-nvim
    bufferline-nvim
    catppuccin-nvim
    cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
    cmp-cmdline # cmp command line suggestions
    cmp-cmdline-history # cmp command line history suggestions
    cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
    cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
    cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/
    cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
    cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
    comment-nvim
    diffview-nvim # https://github.com/sindrets/diffview.nvim/
    eyeliner-nvim # Highlights unique characters for f/F and t/T motions | https://github.com/jinh0/eyeliner.nvim
    friendly-snippets
    gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
    lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
    lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/
    luasnip # snippets | https://github.com/l3mon4d3/luasnip/
    neo-tree-nvim
    neogit # https://github.com/TimUntersberger/neogit/
    noice-nvim # Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    nui-nvim # UI Component Library for Neovim.
    nvim-autopairs
    nvim-cmp # https://github.com/hrsh7th/nvim-cmp
    nvim-colorizer-lua
    nvim-lspconfig
    nvim-navic # Add LSP location to lualine | https://github.com/SmiteshP/nvim-navic
    nvim-notify
    nvim-surround # https://github.com/kylechui/nvim-surround/
    nvim-treesitter-context # nvim-treesitter-context
    nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
    nvim-treesitter.withAllGrammars
    nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
    nvim-unception # Prevent nested neovim sessions | nvim-unception
    nvim-web-devicons
    plenary-nvim
    # statuscol-nvim # Status column | https://github.com/luukvbaal/statuscol.nvim/
    telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim
    telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
    # vim-fugitive # https://github.com/tpope/vim-fugitive/
    # vim-repeat
    vim-tmux-navigator
    vim-unimpaired # predefined ] and [ navigation keymaps | https://github.com/tpope/vim-unimpaired/
    which-key-nvim
    (nvim-treesitter.withPlugins (p: [
      p.c
      p.cpp
      p.nix
      p.lua
      p.python
      p.markdown
      p.markdown_inline
      p.regex
      p.bash
      p.fish
    ]))
  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    clang-tools
    deadnix
    eslint_d
    lua-language-server
    nil
    nixd
    nixfmt-classic
    nixpkgs-fmt
    nodePackages.pyright
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    prettierd
    ruff-lsp
    statix
    stylua
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json { plugins = all-plugins; };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
