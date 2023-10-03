return {
  "svermeulen/vim-cutlass",
  config = function()
    vim.api.nvim_set_keymap('n', "m", "d", {silent = true, noremap = true})
    vim.api.nvim_set_keymap('n', "mm", "dd", {silent = true, noremap = true})
    vim.api.nvim_set_keymap('n', "M", "D", {silent = true, noremap = true})
  end,
}
