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

local plugins = {
	'preservim/nerdtree',            -- File system navigation
	'Xuyuanp/nerdtree-git-plugin',   -- Git integration for NerdTree
	'mechatroner/rainbow_csv',       --
	'davidhalter/jedi-vim',          -- Python IDE features
	'dense-analysis/ale',            -- Asynchronous linting
	'ervandew/supertab',            -- Tab completion in insert mode
	'jiangmiao/auto-pairs',          -- Automatically close brackets
	'junegunn/fzf',
	'majutsushi/tagbar',             -- Module/class tag bar
	'mgedmin/python-imports.vim',    -- Auto import for Python
	'ellisonleao/gruvbox.nvim',
	'psf/black',
	'sheerun/vim-polyglot',         -- Color syntax for any language
	'tmhedberg/SimpylFold',         -- Python folding
	'tpope/vim-eunuch',             -- UNIX commands
	'tpope/vim-fugitive',           -- Git support
	'tpope/vim-repeat',             -- '.' repeating maps from plugins
	'tpope/vim-sensible',           -- Sensible defaults
	'tpope/vim-surround',           -- Brackets and parenthesis and such
	'tpope/vim-unimpaired',         -- See the help
	'tveskag/nvim-blame-line',      -- Git blamer
	'vim-airline/vim-airline',      -- Nice status line
	'zhou13/vim-easyescape',        -- Map jk and kj to <ESC>
	'Puremourning/vimspector',      -- Debugger
	'sindrets/diffview.nvim',
	'deoplete-plugins/deoplete-jedi',
	'deoplete-plugins/deoplete-dictionary',
	'wookayin/semshi',
	'zaldih/themery.nvim', 
	{
    "harrisoncramer/gitlab.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim"
        },
    build = function () require("gitlab").build() end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
	},
	{
    'tzachar/highlight-undo.nvim',
    config = function()
      require('highlight-undo').setup({
      hlgroup = 'HighlightUndo',
      duration = 300,
      })
    end
  },
}
local opts = {} 

require("lazy").setup(plugins, opts)
require("gitlab").setup({
  port = 20136, -- The port of the Go server, which runs in the background
  log_path = vim.fn.stdpath("cache") .. "/gitlab.go-server", -- Log path for the Go server
  keymaps = {
    popup = { -- The popup for comment creation, editing, and replying
      exit = "<Esc>",
      perform_action = "<leader>s", -- Once in normal mode, does action
    },
    discussion_tree = { -- The discussion tree that holds all comments
      jump_to_location = "o",
      edit_comment = "e",
      delete_comment = "dd",
      reply_to_comment = "r",
      toggle_node = "t",
    },
    dialogue = { -- The confirmation dialogue for deleting comments
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    }
  }
})
