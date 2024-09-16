local lspkind_comparator = function(conf)
  local lsp_types = require("cmp.types").lsp
  return function(entry1, entry2)
    if entry1.source.name ~= "nvim_lsp" then
      if entry2.source.name == "nvim_lsp" then
        return false
      else
        return nil
      end
    end
    local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
    local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
    if kind1 == "Variable" and entry1:get_completion_item().label:match "%w*=" then kind1 = "Parameter" end
    if kind2 == "Variable" and entry2:get_completion_item().label:match "%w*=" then kind2 = "Parameter" end

    local priority1 = conf.kind_priority[kind1] or 0
    local priority2 = conf.kind_priority[kind2] or 0
    if priority1 == priority2 then return nil end
    return priority2 < priority1
  end
end

local label_comparator = function(entry1, entry2) return entry1.completion_item.label < entry2.completion_item.label end
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- use suggestions from the LSP
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- adapter for the snippet engine
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp = require "cmp"
    local compare = require "cmp.config.compare"
    local luasnip = require "luasnip"
    local select_opts = { behavior = cmp.SelectBehavior.Select }
    cmp.setup {
      -- tell cmp to use Luasnip as our snippet engine
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "λ",
            luasnip = "⋗",
            buffer = "Ω",
            path = "🖫",
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-j>"] = cmp.mapping.select_next_item(select_opts),

        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<CR>"] = cmp.mapping.confirm { select = false },

        ["<C-f>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-b>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          local col = vim.fn.col "." - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
            fallback()
          else
            cmp.complete()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      }, {
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
      }),
      sorting = {
        comparators = {
          lspkind_comparator {
            kind_priority = {
              Parameter = 14,
              Field = 11,
              Property = 11,
              Constant = 10,
              Enum = 10,
              EnumMember = 10,
              Event = 10,
              Function = 10,
              Method = 10,
              Operator = 10,
              Reference = 10,
              Struct = 10,
              Variable = 9,
              File = 8,
              Folder = 8,
              Class = 5,
              Color = 5,
              Module = 5,
              Keyword = 2,
              Constructor = 1,
              Interface = 1,
              Snippet = 0,
              Text = 1,
              TypeParameter = 1,
              Unit = 1,
              Value = 1,
            },
          },
          label_comparator,
        },
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}
