return {
	dir = "~/projects/bitbucket.nvim/",
	deps = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim",
		"folke/noice.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("bitbucket")
	end,
}
