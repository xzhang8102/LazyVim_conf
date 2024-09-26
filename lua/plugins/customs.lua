-- customization

return {
  {
    "kylechui/nvim-surround",
    opts = {},
  },
  { "folke/flash.nvim", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping["<ESC>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.abort() -- restore the original input
        else
          fallback()
        end
      end, { "i" })
      opts.experimental.ghost_text = false
    end,
  },
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
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        float = {
          border = "rounded",
        },
        virtual_text = false,
      },
    },
  },
}
