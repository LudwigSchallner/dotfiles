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
-- Got to next and previous linting error
nmap("<silent>]w", ":ALENext<CR>zOzz")
nmap("<silent>[w", ":ALEPrevious<CR>zOzz")
-- vimspector
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
