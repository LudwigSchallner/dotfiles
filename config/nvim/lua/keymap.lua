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


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
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

nmap("do", ":DiffviewOpen<CR>")
nmap("dc", ":DiffviewClose<CR>")
