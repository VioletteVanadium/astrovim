return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- dependencies = {
  --   "hrsh7th/cmp-nvim-lsp-signature-help"
  -- },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local lspkind = require "lspkind"
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
      -- { name = "nvim_lsp_signature_help" },
    }
    opts.formatting.format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = {
        menu = function() return math.floor(0.25 * vim.o.columns) end,
        abbr = function() return math.floor(0.25 * vim.o.columns) end,
      },
      show_labelDetails = true,
    }
    opts.window.completion.col_offset = -999
  end,
}
