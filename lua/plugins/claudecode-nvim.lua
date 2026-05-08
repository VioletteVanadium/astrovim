local prefix = "<Leader>a"

return {
  -- "coder/claudecode.nvim",
  "zhao-tong/claudecode.nvim",
  branch = "main",
  dependencies = {
    "folke/snacks.nvim",
    "diogo464/hotreload.nvim",
    "johnernaut/claude-files.nvim",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    terminal_cmd = "~/.local/bin/claude-code",
    focus_after_send = true,
    terminal = {
      split_side = "left",
      provider = "auto",
      auto_close = false,
      snacks_win_opts = {
        position = "bottom",
        height = 0.5,
        width = 1.0,
        border = "rounded",
        title = " Claude ",
        title_pos = "center",
      },
    },
    diff_opts = {
      layout = "inline",
      open_in_new_tab = false,
      keep_terminal_focus = true,
      on_new_file_reject = "close_window",
      auto_close_on_accept = false,
    },
  },
  specs = {
    { "AstroNvim/astroui", opts = { icons = { ClaudeCode = "󰵰" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.mappings then opts.mappings = {} end
        opts.mappings.n = opts.mappings.n or {}
        opts.mappings.v = opts.mappings.v or {}
        opts.mappings.n["<Leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" }
        opts.mappings.n["<Leader>Q"] =
          { function() require("astrocore.buffer").close(0, true) end, desc = "Force close buffer" }
        opts.mappings.n[prefix] = { desc = require("astroui").get_icon("ClaudeCode", 1, true) .. "ClaudeCode" }
        opts.mappings.v[prefix] = { desc = require("astroui").get_icon("ClaudeCode", 1, true) .. "ClaudeCode" }
        opts.mappings.n[prefix .. "c"] = { "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle chat" }
        opts.mappings.v[prefix .. "c"] = { "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle chat" }
        opts.mappings.n[prefix .. "a"] = { "<cmd>ClaudeCodeAdd %<cr>", desc = "Add file to chat" }
        opts.mappings.v[prefix .. "a"] = { "<cmd>ClaudeCodeSend<cr>", desc = "Add selection to chat" }
        opts.mappings.n[prefix .. "h"] = { "<cmd>ClaudeCodeFocus<cr>/resume<cr>", desc = "Restore session" }
        opts.mappings.v[prefix .. "h"] = { "<cmd>ClaudeCodeFocus<cr>/resume<cr>", desc = "Restore session" }
        opts.mappings.n[prefix .. "m"] = { "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" }
        opts.mappings.v[prefix .. "m"] = { "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" }
        opts.mappings.n[prefix .. "g"] = { "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" }
        opts.mappings.n[prefix .. "r"] = { "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" }
        opts.mappings.n[prefix .. "f"] = { function() require("claude-files").toggle() end, desc = "Changed files" }
        opts.mappings.v[prefix .. "f"] = { function() require("claude-files").toggle() end, desc = "Changed files" }
      end,
    },
  },
}
