return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
	opts = {
		dap_enabled = true, -- makes the debugger work with venv
		anaconda_base_path = "~/miniconda3/",
		anaconda_envs_path = "~/miniconda3/envs/",
		parents = 0,
	},
	keys = {
		{
			"<leader>es",
			":VenvSelect<CR>",
		},
	},
}
