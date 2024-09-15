-- customization

return {
  "tpope/vim-surround",
  "tpope/vim-repeat",
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
}
