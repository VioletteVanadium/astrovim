-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "catppuccin",
    -- Configure how folding works
    -- folding = {
    --   -- whether a buffer should have folding can be true/false for global enable/disable or fun(bufnr:integer):boolean
    --   -- enabled = function(bufnr) return require("astrocore.buffer").is_valid(bufnr) end,
    --   enabled = true,
    --   -- a priority list of fold methods to try using, available methods are "lsp", "treesitter", and "indent"
    --   methods = { "lsp", "treesitter", "indent" },
    -- },
    status = {
      separators = {
        left = { "", "" }, -- separator for the left side of the statusline
        right = { "", "" }, -- separator for the right side of the statusline
        tab = { "", "" },
      },
    },
  },
}
