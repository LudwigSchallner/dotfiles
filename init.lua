vim.g.mapleader = " "
require("plugins")
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true  -- Do smart case matching
vim.opt.incsearch = true  -- Incremental search
vim.opt.autowrite = true  -- Automatically save before commands like :next and :make
vim.opt.autoread = true   -- Automatically reload files when externally changed
vim.opt.spell = true      -- Spell checking per default
vim.opt.wrap = false      --  Disable line wrapping (with unimpaired use yow to toggle)
vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.mouse = "nv"
vim.b.surround_indent = 0 -- surround
require("completions")
require("lsp-config")
require("keymap") -- key mappings
require("autocmd") -- auto commands
