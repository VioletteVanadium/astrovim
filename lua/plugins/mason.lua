---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "black",
      "isort",
      -- "flake8",
      -- "mypy",
      "jedi-language-server",
      "typescript-language-server",
      "prettierd",
      "eslint_d",
    },
  },
  dependencies = {
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
      local flake8 = require("lint").linters.flake8
      flake8.args = {
        -- "--config=" .. os.getenv "HOME" .. "/deep-affinity/.flake8",
        "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
        "--no-show-source",
        "--stdin-display-name",
        function() return vim.api.nvim_buf_get_name(0) end,
        "-",
      }
      local pylint = require("lint").linters.pylint
      pylint.args = {
        "-f",
        "json",
        "--from-stdin",
        "--errors-only",
        "--ignored-modules=sh",
        "--disable=no-member",
        function() return vim.api.nvim_buf_get_name(0) end,
      }
      require("lint").linters_by_ft = {
        python = { "flake8", "mypy", "pylint" },
        -- python = { "flake8", "pylint" },
      }
      vim.api.nvim_create_autocmd({ "LspAttach", "InsertLeave", "TextChanged", "BufWrite" }, {
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
}
