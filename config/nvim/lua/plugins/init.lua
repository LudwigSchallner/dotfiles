return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			restriction_mode = "hint",
			disable_mouse = false,
			restricted_keys = {
				["j"] = {},
				["k"] = {},
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					enable = true,
				},
			})
		end,
	},
	{
		"lambdalisue/suda.vim",
		config = function()
			vim.g.suda_nopass = 1
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"chrisgrieser/nvim-puppeteer",
		dependencies = "nvim-treesitter/nvim-treesitter",
		lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
	},
	"mechatroner/rainbow_csv", --
	"junegunn/fzf",
	"mgedmin/python-imports.vim", -- Auto import for Python
	"ellisonleao/gruvbox.nvim",
	"tmhedberg/SimpylFold", -- Python folding
	"tpope/vim-eunuch", -- UNIX commands
	"tpope/vim-fugitive", -- Git support
	"tpope/vim-repeat", -- "." repeating maps from plugins
	"tpope/vim-sensible", -- Sensible defaults
	"tpope/vim-unimpaired", -- See the help
	"tveskag/nvim-blame-line", -- Git blamer
	"vim-airline/vim-airline", -- Nice status line
	"zhou13/vim-easyescape", -- Map jk and kj to <ESC>
	"zaldih/themery.nvim",
	{
		"wookayin/semshi",
		build = ":UpdateRemotePlugins<CR>",
	},
	"tree-sitter/tree-sitter-python",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"rafamadriz/friendly-snippets",
	"mfussenegger/nvim-dap",
}
