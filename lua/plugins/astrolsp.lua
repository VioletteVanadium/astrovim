return {
  "AstroNvim/astrolsp",
  -- we must use the function override because table merging
  -- does not play nicely with list-like tables
  ---@param opts AstroLSPOpts
  opts = function(plugin, opts)
    opts.formatting.format_on_save = true
    opts.formatting.timeout_ms = 5000
    -- safely extend the servers list
    opts.servers = opts.servers or {}
    -- table.insert(opts.servers, "pylsp")

    -- opts.config.pylsp.settings.pylsp.plugins.pycodestyle.enabled = false
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              flake8 = { enabled = false },
              pylsp_mypy = { enabled = true, config_sub_paths = "/home/victoria/deep-affinity/out" },
              isort = { enabled = true },
              black = { enabled = true, line_length = 100, skip_string_normalization = true },
              ruff = { enabled = true },

              jedi_completion = { enabled = false, eager = true },
              jedi_definition = { enabled = false },
              jedi_hover = { enabled = false },
              jedi_references = { enabled = false },
              jedi_signature_help = { enabled = false },
              jedi_symbols = { enabled = false },
              rope_autoimport = { enabled = false },
              rope_completion = { enabled = false, eager = true },

              autopep8 = { enabled = false },
              mccabe = { enabled = false },
              pycodestyle = { enabled = false },
              pydocstyle = { enabled = false },
              pyflakes = { enabled = false },
              pylint = { enabled = false },
              yapf = { enabled = false },
            },
          },
        },
      },
    })
  end,
}
