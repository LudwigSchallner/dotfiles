return {
  {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = {
     restriction_mode="hint",
   },
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  {
    "lambdalisue/suda.vim",
    config = function ()
      vim.g.suda_nopass = 1
    end,
  },
  "mechatroner/rainbow_csv",       --
  "ervandew/supertab",            -- Tab completion in insert mode
  "junegunn/fzf",
  "mgedmin/python-imports.vim",    -- Auto import for Python
  "ellisonleao/gruvbox.nvim",
  -- "psf/black",
  -- "sheerun/vim-polyglot",         -- Color syntax for any language
  "tmhedberg/SimpylFold",         -- Python folding
  "tpope/vim-eunuch",             -- UNIX commands
  "tpope/vim-fugitive",           -- Git support
  "tpope/vim-repeat",             -- "." repeating maps from plugins
  "tpope/vim-sensible",           -- Sensible defaults
  "tpope/vim-unimpaired",         -- See the help
  "tveskag/nvim-blame-line",      -- Git blamer
  "vim-airline/vim-airline",      -- Nice status line
  "zhou13/vim-easyescape",        -- Map jk and kj to <ESC>
  { "sindrets/diffview.nvim",
    config = {
      use_icons=false,
    }
  },
  "zaldih/themery.nvim",
  "wookayin/semshi",
  "nvim-treesitter/nvim-treesitter",
  "tree-sitter/tree-sitter-python",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "mfussenegger/nvim-dap",
 }
