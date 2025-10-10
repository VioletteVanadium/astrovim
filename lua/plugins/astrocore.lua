-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec

local og_virt_text
local og_virt_line
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = {
        virtual_lines = false, -- leave this off by default
      },
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = { current_line = true },
      virtual_lines = { current_line = true }, -- but allow it to be toggled as desired
      underline = false,
      severity_sort = true,
    },
    autocmds = {
      diagnostic_only_virtlines = {
        {
          event = { "CursorMoved", "DiagnosticChanged" },
          callback = function()
            if not require("astrocore.buffer").is_valid() then return end
            if og_virt_line == nil then og_virt_line = vim.diagnostic.config().virtual_lines end

            -- ignore if virtual_lines.current_line is disabled
            if not (og_virt_line and og_virt_line.current_line) then
              if og_virt_text then
                vim.diagnostic.config { virtual_text = og_virt_text }
                og_virt_text = nil
              end
              return
            end

            if og_virt_text == nil then og_virt_text = vim.diagnostic.config().virtual_text end

            local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

            if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
              vim.diagnostic.config { virtual_text = og_virt_text }
            else
              vim.diagnostic.config { virtual_text = false }
            end
          end,
        },
        {
          event = "ModeChanged",
          callback = function()
            if require("astrocore.buffer").is_valid() then pcall(vim.diagnostic.show) end
          end,
        },
      },
    },
  },
}
