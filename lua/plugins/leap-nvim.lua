return {
  "ggandor/leap.nvim",
  commit = "f19d43590c4b6d31188ee1ea2954d2b7558a9e11",
  dependencies = {
    "tpope/vim-repeat",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["s"] = { "<Plug>(leap-forward)", desc = "Leap forward" },
            ["S"] = { "<Plug>(leap-backward)", desc = "Leap backward" },
            ["gs"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
          },
          x = {
            ["s"] = { "<Plug>(leap-forward)", desc = "Leap forward" },
            ["S"] = { "<Plug>(leap-backward)", desc = "Leap backward" },
            ["gs"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
          },
          o = {
            ["s"] = { "<Plug>(leap-forward)", desc = "Leap forward" },
            ["S"] = { "<Plug>(leap-backward)", desc = "Leap backward" },
            ["gs"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
          },
        },
      },
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { leap = true } },
    },
  },
  opts = {},
}
