require('plugins')

-- settings
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
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.mouse = "nv"

vim.g.SuperTabDefaultCompletionType = "<c-n>"-- scroll down with supertab
vim.g.ale_echo_msg_format = '%linter% says %code%: %s'
vim.b.surround_indent = 1 -- surround

-- auto commands
require("autocmd")
-- key mappings
require("keymap")
