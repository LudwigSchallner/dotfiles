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
	'Xuyuanp/nerdtree-git-plugin',   -- Git integration for NerdTree
	'alfredodeza/coveragepy.vim',   -- Python coverage highlight
	'alfredodeza/pytest.vim',        -- Pytest runner plugin
	'mechatroner/rainbow_csv',       --
	'davidhalter/jedi-vim',          -- Python IDE features
	'dense-analysis/ale',            -- Asynchronous linting
	'ervandew/supertab',            -- Tab completion in insert mode
	'fisadev/vim-isort',             -- Sort python imports
	'heavenshell/vim-pydocstring',
	'jiangmiao/auto-pairs',          -- Automatically close brackets
	'junegunn/fzf',
	'majutsushi/tagbar',             -- Module/class tag bar
	'mboughaba/i3config.vim',       -- Syntax for i3 config file
	'mgedmin/python-imports.vim',    -- Auto import for Python
	'ellisonleao/gruvbox.nvim',
	'pedrohdz/vim-yaml-folds',       -- Yaml folding
	'preservim/nerdtree',            -- File system navigation
	'psf/black',
	'relastle/vim-nayvy',            -- Python imports
	--use 'rickhowe/diffchar.vim'         -- git diff character wise
	'sheerun/vim-polyglot',         -- Color syntax for any language
	'tmhedberg/SimpylFold',         -- Python folding
	'tomasr/molokai',               -- Color scheme
	'tpope/vim-eunuch',             -- UNIX commands
	'tpope/vim-fugitive',           -- Git support
	'tpope/vim-repeat',             -- '.' repeating maps from plugins
	'tpope/vim-sensible',           -- Sensible defaults
	'tpope/vim-surround',           -- Brackets and parenthesis and such
	'tpope/vim-unimpaired',         -- See the help
	'tveskag/nvim-blame-line',      -- Git blamer
	'vim-airline/vim-airline',      -- Nice status line
	'vim-pandoc/vim-pandoc',        -- Pandoc integration
	'vim-pandoc/vim-pandoc-syntax', -- Pandoc (markdown) syntax
	'vim-scripts/bats.vim',         -- Syntax highlighting for bats
	'zhou13/vim-easyescape',        -- Map jk and kj to <ESC>
	'Puremourning/vimspector',      -- Debugger
	'sindrets/diffview.nvim',
	'nvim-tree/nvim-web-devicons',
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
