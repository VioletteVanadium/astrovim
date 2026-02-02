return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- using conform.nvim instead
    formatting = { disabled = true },
  },
  config = function(_, opts)
    require("astrolsp").setup(opts)

    -- vim.lsp.config("ty", {
    --   cmd = { "ty", "server" },
    --   filetypes = { "python" },
    --   root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    -- })
    -- vim.lsp.enable("ty", true)

    vim.lsp.config("zuban", {
      cmd = { "zuban", "server" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    })
    vim.lsp.enable("zuban", true)

    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          analysis = {
            typeCheckingMode = "off",
            autoImportCompletions = true,
          },
        },
      },
    })
  end,
  dependencies = {
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "typescript-language-server",
          "eslint_d",
          "ty",
          "basedpyright",
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
        local pylint = require("lint").linters.pylint
        pylint.args = {
          "-f",
          "json",
          "--errors-only",
          "--ignored-modules=sh",
          "--disable=no-member,no-self-argument",
          "--from-stdin",
          function() return vim.api.nvim_buf_get_name(0) end,
        }
        require("lint").linters_by_ft = {
          python = { "ruff", "mypy" },
        }
        vim.api.nvim_create_autocmd({ "LspAttach", "InsertLeave", "BufWritePost" }, {
          callback = function() require("lint").try_lint() end,
        })
      end,
    },
    {
      "stevearc/conform.nvim",
      event = "User AstroFile",
      cmd = "ConformInfo",
      dependencies = {
        {
          "AstroNvim/astrocore",
          opts = {
            options = { opt = { formatexpr = "v:lua.require'conform'.formatexpr()" } },
            commands = {
              Format = {
                function(args)
                  local range = nil
                  if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                      start = { args.line1, 0 },
                      ["end"] = { args.line2, end_line:len() },
                    }
                  end
                  require("conform").format { async = true, range = range }
                end,
                desc = "Format buffer",
                range = true,
              },
            },
          },
        },
      },
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "ruff_organize_imports", "ruff_format" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { "rustfmt" },
          -- Conform will run the first available formatter
          ["_"] = { "prettier", "prettierd", stop_after_first = true },
        },
        default_format_opts = { timeout_ms = 5000, lsp_format = "fallback" },
        format_on_save = function(bufnr)
          if vim.F.if_nil(vim.b[bufnr].autoformat, vim.g.autoformat, true) then
            return { timeout_ms = 5000, lsp_format = "fallback" }
          end
        end,
      },
    },
    {
      "Saghen/blink.cmp",
      -- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/blink.lua
      opts = {
        sources = {
          providers = {
            path = { score_offset = 3 },
            lsp = {
              score_offset = 0,
              fallbacks = { "buffer" },
              -- Filter text items from the LSP provider, since we have the buffer provider for that
              transform_items = function(_, items)
                return vim.tbl_filter(
                  function(item) return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text end,
                  items
                )
              end,
            },
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
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 100,
          },
        },
      },
    },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "User AstroFile",
    --   main = "lsp_signature",
    --   opts = {
    --     floating_window = true,
    --     hint_enable = true,
    --     hint_prefix = {
    --       above = "↙ ",
    --       current = "← ",
    --       below = "↖ ",
    --     },
    --     doc_lines = 0,
    --     toggle_key = "<C-x>",
    --     select_signature_key = "<C-s>",
    --     move_signature_window_key = { "<C-j>", "<C-k>" },
    --     move_cursor_key = "<C-a>",
    --   },
    --   specs = {
    --     { "AstroNvim/astrolsp", optional = true, opts = { defaults = { signature_help = false } } },
    --   },
    -- },
  },
}
