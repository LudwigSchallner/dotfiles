local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies="nvim-lua/plenary.nvim",
    ft = {
      "python"
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    init = function()
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
      vim.keymap.set("n", "<C-N>", ":NvimTreeFindFile<CR>", { silent = true })
    end,
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = true,
          custom = { "__pycache__" },
        },
        renderer = {
          icons = {
            show = {
              folder_arrow = false,
            },
            glyphs = {
              default = "",
              folder = {
                default = "▶",
                open = "▼",
                empty = "▷",
                empty_open = "▽",
              },
            },
          },
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          -- Default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- Custom mappings
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = true }
          end
          vim.keymap.set("n", "<cr>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
          vim.keymap.set("n", "<2-LeftMouse>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
        end,
      })
    end,
  },
	"mechatroner/rainbow_csv",       --
	"ervandew/supertab",            -- Tab completion in insert mode
	"jiangmiao/auto-pairs",          -- Automatically close brackets
	"junegunn/fzf",
	"majutsushi/tagbar",             -- Module/class tag bar
	"mgedmin/python-imports.vim",    -- Auto import for Python
	"ellisonleao/gruvbox.nvim",
	"psf/black",
	"sheerun/vim-polyglot",         -- Color syntax for any language
	"tmhedberg/SimpylFold",         -- Python folding
	"tpope/vim-eunuch",             -- UNIX commands
	"tpope/vim-fugitive",           -- Git support
	"tpope/vim-repeat",             -- "." repeating maps from plugins
	"tpope/vim-sensible",           -- Sensible defaults
	"tpope/vim-surround",           -- Brackets and parenthesis and such
	"tpope/vim-unimpaired",         -- See the help
	"tveskag/nvim-blame-line",      -- Git blamer
	"vim-airline/vim-airline",      -- Nice status line
	"zhou13/vim-easyescape",        -- Map jk and kj to <ESC>
	"sindrets/diffview.nvim",
	"zaldih/themery.nvim",
	"wookayin/semshi",
  "nvim-treesitter/nvim-treesitter",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies={
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("dap-python").test_runner = "pytest"
    end,
  },
	{
    "harrisoncramer/gitlab.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim"
        },
    build = function () require("gitlab").build() end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
	},
	{
    "tzachar/highlight-undo.nvim",
    config = function()
      require("highlight-undo").setup({
      hlgroup = "HighlightUndo",
      duration = 300,
      })
    end
  },
}
local opts = {}

require("lazy").setup(plugins, opts)
require("gitlab").setup({
  port = 20136, -- The port of the Go server, which runs in the background
  log_path = vim.fn.stdpath("cache") .. "/gitlab.go-server", -- Log path for the Go server
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
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.isort,
    require("null-ls").builtins.diagnostics.mypy,
    require("null-ls").builtins.diagnostics.ruff,
    require("null-ls").builtins.diagnostics.pydocstyle,
}
require("null-ls").setup({
  debug=true,
  sources=sources,
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,})
