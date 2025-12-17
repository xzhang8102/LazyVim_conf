-- customization

return {
  {
    "nvim-mini/mini.surround",
    keys = {
      { "ys", mode = { "v", "x" }, false },
      { "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], mode = { "x" }, silent = true },
    },
    opts = function(_, opts)
      -- Module mappings. Use `''` (empty string) to disable one.
      opts.mappings = {
        add = "ys", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        replace = "cs", -- Replace surrounding
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        update_n_lines = "", -- Update `opts.n_lines`

        suffix_last = "", -- Suffix to search with "prev" method
        suffix_next = "", -- Suffix to search with "next" method
      }
      opts.search_method = "cover_or_next"
    end,
  },
  { "folke/flash.nvim", enabled = false },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.mapping["<ESC>"] = cmp.mapping(function(fallback)
  --       if cmp.visible() then
  --         cmp.abort() -- restore the original input
  --       else
  --         fallback()
  --       end
  --     end, { "i" })
  --     opts.experimental.ghost_text = false
  --   end,
  -- },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " ",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      ---@type vim.diagnostic.Opts
      opts.diagnostics = {
        float = {
          border = "rounded",
        },
        virtual_text = false,
      }
    end,
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = function(_, opts)
  --     local actions = require("telescope.actions")
  --     opts.defaults.mappings.i["<ESC>"] = actions.close
  --   end,
  --   keys = {
  --     -- change the keymap to locate a opened buffer
  --     -- vim.keymap.del("n", "<leader>bb") -- remove the default mapping
  --     { "<leader>fb", false },
  --     { "<leader>bb", "<cmd>Telescope buffers sort_mru=true<cr>", desc = "Find Buffers" },
  --     { "<leader>sM", "<cmd>Telescope man_pages sections={'ALL'}<cr>", desc = "Man Pages" },
  --   },
  --   end
  -- },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft["python"] = { "black" }
      opts.formatters.sqlfluff = {
        args = { "format", "-" },
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        sqlfluff = {
          args = {
            "lint",
            "--format=json",
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion.ghost_text = {
        enabled = false,
      }
      opts.keymap = {
        preset = "default",
        ["<ESC>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      }
      opts.cmdline.enabled = false
    end,
  },
  -- {
  --   "ibhagwan/fzf-lua",
  --   keys = {
  --     {
  --       "<leader>fp",
  --       LazyVim.pick("files", { cwd = vim.fn.stdpath("data") .. "/lazy" }),
  --       desc = "Find Files (plugins)",
  --     },
  --   },
  -- },
  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      table.insert(opts.library, { path = "snacks", words = { "Snacks" } })
    end,
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          explorer = { hidden = true },
        },
        layout = {
          preset = function()
            return vim.o.columns >= 120 and "default" or "dropdown"
          end,
        },
      },
      dashboard = {
        enabled = false,
      },
      lazygit = {
        config = {
          gui = {
            showRandomTip = false,
          },
        },
      },
      terminal = {
        relative = "editor",
        keys = {
          term_normal = false,
        },
        win = {
          style = "terminal",
          position = "float",
        },
      },
      styles = {
        notification = {
          relative = "editor",
          wo = {
            winblend = 0,
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      -- lsp progress is handled by vim.notify()
      -- ref: autocmds.lua
      lsp = {
        progress = {
          enabled = false,
        },
      },
      cmdline = {
        -- view = "cmdline", -- moves command line to bottom
        format = {
          -- show command line input in whole when trying to run `:help` and `:lua`
          lua = false,
          help = false,
        },
      },
      presets = {
        lsp_doc_border = true,
        -- command_palette = false, -- tab completions for commandline don't pop-up at top
      },
      routes = {
        {
          -- skip unknown message kind
          -- see :help ui-messages
          filter = { event = "msg_show", kind = "" },
          opts = { skip = true },
        },
      },
    },
  },
}
