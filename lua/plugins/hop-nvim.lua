return {
  "smoka7/hop.nvim",
  opts = {},
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["s"] = {
            function()
              require("hop").hint_char2 {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = false,
              }
            end,
            desc = "Hop __ after cursor",
          },
          ["<S-s>"] = {
            function()
              require("hop").hint_char2 {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = false,
              }
            end,
            desc = "Hop __ before cursor",
          },
          ["<Leader><Leader>"] = { desc = "Hop" },
          ["<Leader><Leader>b"] = {
            function()
              require("hop").hint_words {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
              }
            end,
            desc = "Hop word before cursor",
          },
          ["<Leader><Leader>w"] = {
            function()
              require("hop").hint_words {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
              }
            end,
            desc = "Hop word after cursor",
          },
          ["<Leader><Leader>k"] = {
            function()
              require("hop").hint_lines {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
              }
            end,
            desc = "Hop line before cursor",
          },
          ["<Leader><Leader>j"] = {
            function()
              require("hop").hint_lines {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
              }
            end,
            desc = "Hop line after cursor",
          },
        },
        v = {
          ["<Leader>s"] = {
            function()
              require("hop").hint_char2 {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = false,
              }
            end,
            desc = "Hop __ after cursor",
          },
          ["<Leader><S-s>"] = {
            function()
              require("hop").hint_char2 {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = false,
              }
            end,
            desc = "Hop __ before cursor",
          },
          ["<Leader><Leader>"] = { desc = "Hop" },
          ["<Leader><Leader>b"] = {
            function()
              require("hop").hint_words {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
              }
            end,
            desc = "Hop word before cursor",
          },
          ["<Leader><Leader>w"] = {
            function()
              require("hop").hint_words {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
              }
            end,
            desc = "Hop word after cursor",
          },
          ["<Leader><Leader>k"] = {
            function()
              require("hop").hint_lines {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
              }
            end,
            desc = "Hop line before cursor",
          },
          ["<Leader><Leader>j"] = {
            function()
              require("hop").hint_lines {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
              }
            end,
            desc = "Hop line after cursor",
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
      opts = { integrations = { hop = true } },
    },
  },
}
