return {
  "akinsho/bufferline.nvim",
  name = "bufferline.nvim",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      indicator = { style = "underline" },
      max_name_length = 24,
      tab_size = 24,
      groups = {
        options = {
          toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        },
        items = {
          {
            name = "Tests", -- Mandatory
            highlight = { underline = true, sp = "blue" }, -- Optional
            priority = 2, -- determines where it will appear relative to other groups (Optional)
            icon = " ", -- Optional
            matcher = function(buf) -- Mandatory
              return buf.path:match "%_test" or buf.path:match "%_spec"
            end,
          },
          {
            name = "Docs",
            highlight = { undercurl = true, sp = "green" },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf) return buf.path:match "%.md" or buf.path:match "%.txt" end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
        },
      },
    },
  },
}
