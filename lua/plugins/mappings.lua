return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map

          -- navigate buffer tabs
          ["L"] = { function() require("bufferline").cycle(1) end, desc = "Next buffer" },
          ["H"] = { function() require("bufferline").cycle(-1) end, desc = "Previous buffer" },

          -- this is useful for naming menus
          ["<Leader>b"] = { desc = "Buffers" },
          ["<Leader>bc"] = { function() require("bufferline").unpin_and_close() end, desc = "Close current buffer" },
          ["<Leader>bd"] = { "<cmd>BufferLinePickClose<cr>", desc = "Close buffer using picker" },
          ["<Leader>bD"] = { "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other visible buffers" },
          ["<Leader>bh"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
          ["<Leader>bl"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
          ["<Leader>br"] = { "<cmd>BufferLineTabRename<cr>", desc = "Tab rename" },
          ["<Leader>bg"] = { desc = "Group commands" },
          ["<Leader>bgt"] = { "<cmd>BufferLineGroupToggle Tests", desc = "Toggle Tests group" },
          ["<Leader>bgd"] = { "<cmd>BufferLineGroupToggle Docs", desc = "Toggle Docs group" },
          ["<Leader>bgT"] = { "<cmd>BufferLineGroupClose Tests", desc = "Close Tests group" },
          ["<Leader>bgD"] = { "<cmd>BufferLineGroupClose Docs", desc = "Close Docs group" },

          -- -- override sorting for buffer picker
          -- ["<Leader>fb"] = {
          --   function()
          --     -- require("snacks").picker.buffers { sort_lastused = false, sort = { fields = { "desc:score", "file", "idx" } } }
          --     require("snacks").picker.smart {
          --       multi = { "buffers" },
          --       format = "file",
          --       matcher = { cwd_bonus = false, frecency = true, sort_empty = true },
          --     }
          --   end,
          --   desc = "Find buffers",
          -- },
          -- ["<Leader>fw"] = {
          --   function()
          --     require("snacks").picker.grep {
          --       sort = { fields = { "#text", "file" } },
          --     }
          --   end,
          --   desc = "Find words",
          -- },
        },
        t = {
          -- setting a mapping to false will disable it
          ["<esc>"] = false,
        },
      },
    },
  },
}
