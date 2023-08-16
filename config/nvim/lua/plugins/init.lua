local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return {
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "mechatroner/rainbow_csv",       --
	"ervandew/supertab",            -- Tab completion in insert mode
	"jiangmiao/auto-pairs",          -- Automatically close brackets
	"junegunn/fzf",
	"majutsushi/tagbar",             -- Module/class tag bar
	"mgedmin/python-imports.vim",    -- Auto import for Python
	"ellisonleao/gruvbox.nvim",
	-- "psf/black",
	"sheerun/vim-polyglot",         -- Color syntax for any language
	"tmhedberg/SimpylFold",         -- Python folding
	"tpope/vim-eunuch",             -- UNIX commands
	"tpope/vim-fugitive",           -- Git support
	"tpope/vim-repeat",             -- "." repeating maps from plugins
	"tpope/vim-sensible",           -- Sensible defaults
	"tpope/vim-surround",           -- Brackets and parenthesis and such
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
