return {
  "AstroNvim/astrolsp",
  -- we must use the function override because table merging
  -- does not play nicely with list-like tables
  ---@param opts AstroLSPOpts
  opts = function(plugin, opts)
    opts.formatting.format_on_save = false
    opts.formatting.timeout_ms = 2000
    -- safely extend the servers list
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "pylsp")

    -- opts.config.pylsp.settings.pylsp.plugins.pycodestyle.enabled = false
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              autopep8 = { enabled = false },
              flake8 = { enabled = true },
              mccabe = { enabled = false },
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              yapf = { enabled = false },
              pylsp_mypy = { enabled = true, live_mode = true },
            },
          },
        },
      },
    })
  end,
}
