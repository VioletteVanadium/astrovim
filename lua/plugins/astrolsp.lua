return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = false, -- enable or disable automatic formatting on save
      timeout_ms = 3200, -- adjust the timeout_ms variable for formatting
      -- disabled = { "lua_ls" },
      -- filter = function(client)
      --   -- only enable null-ls for javascript files
      --   if vim.bo.filetype == "javascript" then
      --     return client.name == "null-ls"
      --   end
      --
      --   -- enable all other clients
      --   return true
      -- end,
    },
  },
}
