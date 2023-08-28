return { "sindrets/diffview.nvim",
    config = function ()
      vim.api.nvim_set_keymap("n", "<leader>dv", ":DiffviewOpen ", { noremap = true})
      require("diffview").setup({
      	use_icons=false,
      })
    end,
}
