return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        t = {
          -- setting a mapping to false will disable it
          ["<esc>"] = false,
        },
        n = {
          -- navigate buffer tabs
          ["L"] = { function() require("bufferline").cycle(1) end, desc = "Next buffer" },
          ["H"] = { function() require("bufferline").cycle(-1) end, desc = "Previous buffer" },

          -- this is useful for naming menus
          ["<Leader>b"] = { desc = "Buffers" },
          ["<Leader>bc"] = { function() require("bufferline").unpin_and_close() end, desc = "Close current buffer" },
          ["<Leader>bd"] = { "<cmd>BufferLinePickClose<cr>", desc = "Close buffer using picker" },
          ["<Leader>bD"] = { "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other visible buffers" },
          ["<Leader>bh"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
          ["<Leader>bl"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
          ["<Leader>br"] = { "<cmd>BufferLineTabRename<cr>", desc = "Tab rename" },
          ["<Leader>bg"] = { desc = "Group commands" },
          ["<Leader>bgt"] = { "<cmd>BufferLineGroupToggle Tests", desc = "Toggle Tests group" },
          ["<Leader>bgd"] = { "<cmd>BufferLineGroupToggle Docs", desc = "Toggle Docs group" },
          ["<Leader>bgT"] = { "<cmd>BufferLineGroupClose Tests", desc = "Close Tests group" },
          ["<Leader>bgD"] = { "<cmd>BufferLineGroupClose Docs", desc = "Close Docs group" },

          -- idk why this is missing
          ["<Leader>fn"] = { function() require("snacks").picker.notifications() end, desc = "Find notifications" },

          -- lsp mappings
          ["gb"] = { "<C-t>", desc = "Pop from tag stack" },
          ["gd"] = { "<C-]>", desc = "Go to definition" },
          ["gD"] = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            -- cond = function(client, _) return client.server_capabilities.declarationProvider end,
          },
          ["gK"] = {
            function() vim.lsp.buf.signature_help() end,
            desc = "Signature help",
            -- cond = function(client, _) return client.server_capabilities.signatureHelpProvider end,
          },
          ["gy"] = {
            function() vim.lsp.buf.type_definition() end,
            desc = "Definition of current type",
            -- cond = function(client, _) return client.server_capabilities.typeDefinitionProvider end,
          },
          ["<Leader>la"] = {
            function() vim.lsp.buf.code_action() end,
            desc = "LSP code action",
            -- cond = function(client, _) return client.server_capabilities.codeActionProvider end,
          },
          ["<Leader>lA"] = {
            function() vim.lsp.buf.code_action { context = { only = { "source" }, diagnostics = {} } } end,
            desc = "LSP source action",
            -- cond = function(client, _) return client.server_capabilities.codeActionProvider end,
          },
          ["<Leader>lb"] = { "<C-t>", desc = "Pop from tag stack" },
          ["<Leader>lc"] = { function() vim.cmd.ConformInfo() end, desc = "Conform information" },
          ["<Leader>ld"] = { "<C-]>", desc = "Go to definition" },
          ["<Leader>lf"] = { function() vim.cmd.Format() end, desc = "Format buffer" },
          ["<Leader>lG"] = {
            function() vim.lsp.buf.workspace_symbol() end,
            desc = "Search workspace symbols",
            -- cond = function(client, _) return client.server_capabilities.workspaceSymbolProvider end,
          },
          ["<Leader>lh"] = {
            function() vim.lsp.buf.signature_help() end,
            desc = "Signature help",
            -- cond = function(client, _) return client.server_capabilities.signatureHelpProvider end,
          },
          ["<Leader>ll"] = {
            function() vim.lsp.codelens.refresh() end,
            desc = "LSP CodeLens refresh",
            -- cond = function(client, _) return client.server_capabilities.codeLensProvider end,
          },
          ["<Leader>lL"] = {
            function() vim.lsp.codelens.run() end,
            desc = "LSP CodeLens run",
            -- cond = function(client, _) return client.server_capabilities.codeLensProvider end,
          },
          ["<Leader>lR"] = {
            function() vim.lsp.buf.references() end,
            desc = "Search references",
            -- cond = function(client, _) return client.server_capabilities.referencesProvider end,
          },
          ["<Leader>lr"] = {
            function() vim.lsp.buf.rename() end,
            desc = "Rename current symbol",
            -- cond = function(client, _) return client.server_capabilities.renameProvider end,
          },
          ["<Leader>uf"] = {
            function()
              vim.b.autoformat = not vim.F.if_nil(vim.b.autoformat, vim.g.autoformat, true)
              require("astrocore").notify(string.format("Buffer autoformatting %s", vim.b.autoformat and "on" or "off"))
            end,
            desc = "Toggle autoformatting (buffer)",
          },
          ["<Leader>uF"] = {
            function()
              vim.g.autoformat, vim.b.autoformat = not vim.F.if_nil(vim.g.autoformat, true), nil
              require("astrocore").notify(string.format("Global autoformatting %s", vim.g.autoformat and "on" or "off"))
            end,
            desc = "Toggle autoformatting (global)",
          },
          ["<Leader>uh"] = {
            function() require("astrolsp.toggles").buffer_inlay_hints() end,
            desc = "Toggle LSP inlay hints (buffer)",
            -- cond = function(client, _) return vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider end,
          },
          ["<Leader>uH"] = {
            function() require("astrolsp.toggles").inlay_hints() end,
            desc = "Toggle LSP inlay hints (global)",
            -- cond = function(client, _) return vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider end,
          },
          ["<Leader>uL"] = {
            function() require("astrolsp.toggles").codelens() end,
            desc = "Toggle CodeLens",
            -- cond = function(client, _) return client.server_capabilities.codeLensProvider end,
          },
          ["<Leader>uY"] = {
            function() require("astrolsp.toggles").buffer_semantic_tokens() end,
            desc = "Toggle LSP semantic highlight (buffer)",
            -- cond = function(client, _)
            --   return vim.lsp.semantic_tokens and client.server_capabilities.semanticTokensProvider
            -- end,
          },
          ["<Leader>u?"] = {
            function() require("astrolsp.toggles").signature_help() end,
            desc = "Toggle automatic signature help",
            -- cond = function(client, _) return client.server_capabilities.signatureHelpProvider end,
          },
        },
      },
    },
  },
}
