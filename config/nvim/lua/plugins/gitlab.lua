return 	{
    "harrisoncramer/gitlab.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim"
        },
    build = function () require("gitlab").build() end, -- Builds the Go binary
    config = function()
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
    end,
	}
