return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    enabled = true,
  },
  build = function () require("gitlab.server").build() end, -- Builds the Go binary
  config = function()
    local gitlab = require("gitlab")
    require("gitlab").setup({
	reviewer = "diffview",
    })
    vim.keymap.set("n", "<leader>gls", gitlab.summary)
    vim.keymap.set("n", "<leader>gld", gitlab.toggle_discussions)

  end,
}
