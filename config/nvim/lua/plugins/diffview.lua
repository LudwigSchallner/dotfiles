return {
	"sindrets/diffview.nvim",
	config = function()
		local command =
			"git show-branch -a | grep '\\*' | grep -v `git rev-parse --abbrev-ref HEAD` | head -n1 | sed 's/.*\\[\\(.*\\)\\].*/\\1/' | sed 's/[\\^~].*//'"
		local base_branch = vim.fn.system(command)
		vim.api.nvim_set_keymap("n", "<leader>dvb", ":DiffviewOpen " .. base_branch .. "", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>dv", ":DiffviewOpen ", { noremap = true })
		require("diffview").setup({
			use_icons = false,
		})
	end,
}
