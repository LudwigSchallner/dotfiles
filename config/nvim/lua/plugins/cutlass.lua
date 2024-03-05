return {
	"svermeulen/vim-cutlass",
	config = function()
		vim.keymap.set({ "n", "v" }, "m", "d", { silent = true, noremap = true })
		vim.keymap.set({ "n", "v" }, "mm", "dd", { silent = true, noremap = true })
		vim.keymap.set({ "n", "v" }, "M", "D", { silent = true, noremap = true })
	end,
}
