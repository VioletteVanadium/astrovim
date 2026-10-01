local prefix = "<Leader>A"

return {
  "JonLD/codex.nvim",
  cmd = {
    "Codex",
    "CodexReferenceFile",
    "CodexReferenceSelected",
    "CodexSendSelected",
  },
  dependencies = {
    "folke/snacks.nvim",
  },
  opts = {
    env = {
      NVIM = vim.v.servername,
    },
    terminal = {
      provider = "snacks",
      auto_close = false,
      snacks_win_opts = {
        position = "bottom",
        height = 0.5,
        width = 1.0,
        border = "rounded",
        title = " Codex ",
        title_pos = "center",
      },
    },
  },
  specs = {
    { "AstroNvim/astroui", opts = { icons = { Codex = "󱙺" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.mappings then opts.mappings = {} end
        opts.mappings.n = opts.mappings.n or {}
        opts.mappings.v = opts.mappings.v or {}
        opts.mappings.n[prefix] = { desc = require("astroui").get_icon("Codex", 1, true) .. "Codex" }
        opts.mappings.v[prefix] = { desc = require("astroui").get_icon("Codex", 1, true) .. "Codex" }
        opts.mappings.n[prefix .. "c"] = { "<cmd>Codex<cr>", desc = "Toggle chat" }
        opts.mappings.v[prefix .. "c"] = { "<cmd>Codex<cr>", desc = "Toggle chat" }
        opts.mappings.n[prefix .. "a"] = { "<cmd>CodexReferenceFile!<cr>", desc = "Add file to chat" }
        opts.mappings.v[prefix .. "a"] = { "<cmd>CodexSendSelected!<cr>", desc = "Add selection to chat" }
        opts.mappings.n[prefix .. "h"] = { "<cmd>Codex resume<cr>", desc = "Restore session" }
        opts.mappings.v[prefix .. "h"] = { "<cmd>Codex resume<cr>", desc = "Restore session" }
      end,
    },
  },
}
