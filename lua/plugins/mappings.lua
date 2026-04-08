return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        t = {
          ["<esc>"] = false,
        },
        n = {
          -- buffer navigation
          ["L"] = { function() require("bufferline").cycle(1) end, desc = "Next buffer" },
          ["H"] = { function() require("bufferline").cycle(-1) end, desc = "Previous buffer" },

          -- go to file under cursor
          ["gF"] = { "<cmd>call Goto_cWORD(winwidth(0) >=# 180 ? 'vsp' : 'sp')<CR>" },

          -- buffer management
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

          -- telescope/notifications
          ["<Leader>fn"] = {
            function()
              if require("astrocore").is_available "nvim-notify" then
                require("telescope").extensions.notify.notify()
              else
                require("snacks").picker.notifications()
              end
            end,
            desc = "Find notifications",
          },

          -- custom lsp overrides (use tag stack / conform instead of lsp defaults)
          ["gb"] = { "<C-t>", desc = "Pop from tag stack" },
          ["gd"] = { "<C-]>", desc = "Go to definition" },
          ["<Leader>lb"] = { "<C-t>", desc = "Pop from tag stack" },
          ["<Leader>lc"] = { function() vim.cmd.ConformInfo() end, desc = "Conform information" },
          ["<Leader>ld"] = { "<C-]>", desc = "Go to definition" },
          ["<Leader>lf"] = { function() vim.cmd.Format() end, desc = "Format buffer" },

          -- custom conform autoformat toggles
          ["<Leader>uf"] = {
            function()
              vim.b.autoformat = not vim.F.if_nil(vim.b.autoformat, vim.g.autoformat, true)
              require("astrocore").notify(string.format("Buffer autoformatting %s", vim.b.autoformat and "on" or "off"))
            end,
            desc = "Toggle autoformatting (buffer)",
          },
          ["<Leader>uF"] = {
            function()
              vim.g.autoformat, vim.b.autoformat = not vim.F.if_nil(vim.g.autoformat, true), nil
              require("astrocore").notify(string.format("Global autoformatting %s", vim.g.autoformat and "on" or "off"))
            end,
            desc = "Toggle autoformatting (global)",
          },

        },
      },
    },
  },
}
