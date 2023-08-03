require('plugins')

-- functions for key mapping
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true})
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function nmapsilent(shortcut, command)
  vim.api.nvim_set_keymap('n', shortcut, command, {silent = true, noremap = true})
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

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
vim.g.pydocstring_formatter = "numpy"
vim.g.ale_echo_msg_format = '%linter% says %code%: %s'
nmapsilent("<leader>ds", "<Plug>(pydocstring)") -- configure numpy formatting for docstrings

vim.b.surround_indent = 1 -- surround
-- package settings
require("gitlab").setup({
  base_branch = "main",
  port = 20136, -- The port of the Go server, which runs in the background
  keymaps = {
    popup = { -- The popup for comment creation, editing, and replying
      exit = "<Esc>",
      perform_action = "<leader>s", -- Once in normal mode, does action
    },
    discussion_tree = { -- The discussion tree that holds all comments
      jump_to_location = "o",
      edit_comment = "e",
      delete_comment = "dd",
      reply_to_comment = "r",
      toggle_node = "t",
    },
    dialogue = { -- The confirmation dialogue for deleting comments
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    }
  }
})
-- vim.opt.NERDTreeIgnore = { '.pyc', '__pycache__', '.git', '.eggs', '.egg-info', '_cache', '.swp', '.tox' } -- ignore temp files in nerdtree
-- let g:jedi#completions_enabled = 0 -- jedi

-- Save and quit quickly
nmapsilent("<leader>w", ":wa<CR>")
nmapsilent("<leader>q", ":x<CR>")
nmapsilent("<leader>x", ":xa<CR>")
-- Navigation between windows
nmap("<C-h>", "<C-w><C-h>")
nmap("<C-j>", "<C-w><C-j>")
nmap("<C-k>", "<C-w><C-k>")
nmap("<C-l>", "<C-w><C-l>")
nmap("<C-j>", "<C-w><C-j>")
-- Navigation between tabs
nmap("<C-f>", ":tabnext<CR>")
nmap("<C-d>", ":tabprevious<CR>")
-- NERDTree
nmap("<C-n>", ":NERDTreeToggleVCS<CR>")
-- Fugitive
nmap("gs", ":wa<CR> :vertical Git<CR>")
nmap("<leader>gp", ":Git push<CR>")
nmap("<leader>gb", ":Git blame<CR>")
-- Goto's
nmap("gn", ":Semshi goto name next<CR>zOzz")
nmap("gN", ":Semshi goto name prev<CR>zOzz")
nmap("gf", ":Semshi goto function next<CR>zOzt")
nmap("gF", "k:Semshi goto function prev<CR>zOzt")
nmap("gc", ":Semshi goto class next<CR>zOzt")
nmap("gC", "k:Semshi goto class prev<CR>zOzt")
-- Python Tags
nmap("<leader>b", ":TagbarToggle<CR>")
-- Got to next and previous linting error
nmap("<silent>]w", ":ALENext<CR>zOzz")
nmap("<silent>[w", ":ALEPrevious<CR>zOzz")
-- Pytest
nmap("<leader>tt", ":Pytest project<CR>")
nmap("<leader>tv", ":Pytest project verbose<CR>")
nmap("<leader>tf", ":Pytest file verbose<CR>")
nmap("<leader>tll", ":Pytest function<CR>")
nmap("<leader>tlv", ":Pytest function verbose<CR>")
-- Coverage
nmap("<leader>cs", ":Coveragepy show<CR>")
nmap("<leader>cr", ":Coveragepy session<CR>")
-- let g:DiffUnit="Word"
nmap("<leader>dd", ":call vimspector#Launch()<CR>")
nmap("<leader>de", ":call vimspector#Reset()<CR>")
nmap("<leader>dc", ":call vimspector#Continue()<CR>")

nmap("<leader>dt", ":call vimspector#ToggleBreakpoint()<CR>")
nmap("<leader>dT", ":call vimspector#ClearBreakpoints()<CR>")

nmap("<leader>dk", "<Plug>VimspectorRestart")
nmap("<leader>dh", "<Plug>VimspectorStepOut")
nmap("<leader>dl", "<Plug>VimspectorStepInto")
nmap("<leader>dj", "<Plug>VimspectorStepOver")
nmap("do", ":DiffviewOpen<CR>")
nmap("dc", ":DiffviewClose<CR>")
