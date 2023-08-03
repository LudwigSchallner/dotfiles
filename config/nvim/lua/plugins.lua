return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'Xuyuanp/nerdtree-git-plugin'   -- Git integration for NerdTree
	use 'alfredodeza/coveragepy.vim'    -- Python coverage highlight
	use 'alfredodeza/pytest.vim'        -- Pytest runner plugin
	use 'mechatroner/rainbow_csv'       --
	use 'davidhalter/jedi-vim'          -- Python IDE features
	use 'dense-analysis/ale'            -- Asynchronous linting
	use 'drewtempelmeyer/palenight.vim' -- Color scheme
	use 'ervandew/supertab'             -- Tab completion in insert mode
	use 'fisadev/vim-isort'             -- Sort python imports
	use 'heavenshell/vim-pydocstring'
	use 'jiangmiao/auto-pairs'          -- Automatically close brackets
	use 'junegunn/fzf'
	use 'majutsushi/tagbar'             -- Module/class tag bar
	use 'mboughaba/i3config.vim'        -- Syntax for i3 config file
	use 'mgedmin/python-imports.vim'    -- Auto import for Python
	use 'ellisonleao/gruvbox.nvim'
	use 'ribru17/bamboo.nvim'
	use 'pedrohdz/vim-yaml-folds'       -- Yaml folding
	use 'preservim/nerdtree'            -- File system navigation
	use 'psf/black'
	use 'rebelot/kanagawa.nvim'         -- Color scheme
	use 'relastle/vim-nayvy'            -- Python imports
	--use 'rickhowe/diffchar.vim'         -- git diff character wise
	use 'sainnhe/everforest'
	use 'sheerun/vim-polyglot'          -- Color syntax for any language
	use 'tmhedberg/SimpylFold'          -- Python folding
	use 'tomasr/molokai'                -- Color scheme
	use 'tpope/vim-eunuch'              -- UNIX commands
	use 'tpope/vim-fugitive'            -- Git support
	use 'tpope/vim-repeat'              -- '.' repeating maps from plugins
	use 'tpope/vim-sensible'            -- Sensible defaults
	use 'tpope/vim-surround'            -- Brackets and parenthesis and such
	use 'tpope/vim-unimpaired'          -- See the help
	use 'tveskag/nvim-blame-line'       -- Git blamer
	use 'vim-airline/vim-airline'       -- Nice status line
	use 'vim-pandoc/vim-pandoc'         -- Pandoc integration
	use 'vim-pandoc/vim-pandoc-syntax'  -- Pandoc (markdown) syntax
	use 'vim-scripts/bats.vim'          -- Syntax highlighting for bats
	use 'zhou13/vim-easyescape'         -- Map jk and kj to <ESC>
	use 'Puremourning/vimspector'       -- Debugger
	use 'sindrets/diffview.nvim'
	use 'nvim-tree/nvim-web-devicons'
  use 'deoplete-plugins/deoplete-jedi'
  use 'deoplete-plugins/deoplete-dictionary'
  use 'wookayin/semshi'
	use 'zaldih/themery.nvim' 
	use { 'tzachar/highlight-undo.nvim', config = function()  require('highlight-undo').setup({
    hlgroup = 'HighlightUndo',
    duration = 5000,
})end}
  use {
  'harrisoncramer/gitlab.nvim',
	branch = 'self-hosted',
  requires = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim"
  },
  run = function() require("gitlab").build() end,
  config = function()
    require("gitlab").setup()
  end,
}
end)
