-- customization

return {
  {
    "kylechui/nvim-surround",
    opts = {},
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
    "williamboman/mason.nvim",
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
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
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
    end,
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
    end,
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>fp",
        LazyVim.pick("files", { cwd = vim.fn.stdpath("data") .. "/lazy" }),
        desc = "Find Files (plugins)",
      },
    },
  },
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
    },
  },
}
