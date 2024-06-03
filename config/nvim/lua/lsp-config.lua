require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ruff_lsp",
		"pyright",
		"jsonls",
		"yamlls",
		"arduino_language_server",
	},
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").arduino_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").yamlls.setup({
	on_attach = function()
		on_attach()
		vim.keymap.set("n", "<leader>rn", ":%s/\\<<C-r><C-w>\\>/", {})
	end,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	filetypes = { "python" },
	capabilities = (function()
		local _capabilities = vim.lsp.protocol.make_client_capabilities()
		_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
		return _capabilities
	end)(),
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})

local on_attach_ruff = function(client, bufnr)
	if client.name == "ruff_lsp" then
		-- Disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
	end
end

require("lspconfig").ruff_lsp.setup({
	on_attach = on_attach_ruff,
})

-- folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
--
