return {
  {
    "Saghen/blink.cmp",
    -- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/blink.lua
    opts = {
      sources = {
        providers = {
          path = { score_offset = 3 },
          lsp = { score_offset = 0 },
          snippets = { score_offset = -1 },
          buffer = { score_offset = -3 },
        },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        accept = {
          auto_brackets = { enabled = false },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint_d",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local mypy = require("lint").linters.mypy
      mypy.args = {
        "--show-column-numbers",
        "--show-error-end",
        "--hide-error-context",
        "--no-color-output",
        "--no-error-summary",
        "--no-pretty",
        "--config-file",
        os.getenv "HOME" .. "/.mypy.ini",
      }
      local dmypy = require("lint").linters.dmypy
      dmypy.args = {
        "run",
        "--timeout",
        "50000",
        "--",
        "--show-column-numbers",
        "--show-error-end",
        "--hide-error-context",
        "--no-color-output",
        "--no-error-summary",
        "--no-pretty",
        "--config-file",
        os.getenv "HOME" .. "/.mypy.ini",
      }
      require("lint").linters_by_ft = {
        python = { "mypy", "ruff" },
      }
      vim.api.nvim_create_autocmd({ "LspAttach", "InsertLeave", "TextChanged", "BufWritePost" }, {
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff_organize_imports", "ruff_format" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettier", "prettierd", stop_after_first = true },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "User AstroFile",
    main = "lsp_signature",
    opts = {
      floating_window = false,
      hint_enable = true,
      hint_prefix = {
        above = "↙ ",
        current = "← ",
        below = "↖ ",
      },
      doc_lines = 0,
      toggle_key = "<C-x>",
      select_signature_key = "<C-s>",
      move_signature_window_key = { "<C-j>", "<C-k>" },
      move_cursor_key = "<C-a>",
    },
    specs = {
      { "AstroNvim/astrolsp", optional = true, opts = { defaults = { signature_help = false } } },
    },
  },
}
