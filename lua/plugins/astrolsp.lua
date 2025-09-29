return {
  "AstroNvim/astrolsp",
  -- we must use the function override because table merging
  -- does not play nicely with list-like tables
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.formatting.format_on_save.enabled = false
    opts.formatting.timeout_ms = 5000

    opts.servers = opts.servers or {}
    -- table.insert(opts.servers, "jedi_language_server")

    local lspconfig = require "lspconfig"
    lspconfig.basedpyright.setup {
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          analysis = {
            autoImportCompletions = true,
            useTypingExtensions = true,
          },
        },
      },
    }
  end,
}
