return {
  "nvim-neorg/neorg",
  version = "^9",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    vim.keymap.set("n", "<Leader>N", "<Plug>(neorg.dirman.new-note)", {desc = "Neorg"})
    return astrocore.extend_tbl(opts, {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.completion"] = {
          config = {
            engine = (astrocore.is_available "nvim-cmp" and "nvim-cmp")
              or (astrocore.is_available "coq_nvim" and "coq_nvim")
              or (astrocore.is_available "nvim-compe" and "nvim-compe"),
          },
        }, -- Enables support for completion plugins
        ["core.journal"] = {}, -- Enables support for the journal module
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "norg" })
        end
      end,
    },
  },
}
