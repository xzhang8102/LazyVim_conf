-- customization

return {
  {
    "kylechui/nvim-surround",
    vscode = true,
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
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults.mappings.i["<ESC>"] = actions.close
    end,
  },
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

      opts.servers.gopls = {
        mason = not vim.fn.executable("gopls"),
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- change the keymap to locate a opened buffer
      { "<leader>fb", false },
      { "<leader>bb", "<cmd>Telescope buffers sort_mru=true<cr>", desc = "Find Buffers" },
      { "<leader>sM", "<cmd>Telescope man_pages sections={'ALL'}<cr>", desc = "Man Pages" },
    },
  },
  {
    "stevearc/conform.nvim",
    ---@param opts conform.setupOpts
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
      }
    end,
  },
}
