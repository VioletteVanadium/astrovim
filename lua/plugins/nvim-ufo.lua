return {
  "kevinhwang91/nvim-ufo",
  event = { "User AstroFile", "InsertEnter" },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["zR"] = { function() require("ufo").openAllFolds() end, desc = "Open all folds" }
        maps.n["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close all folds" }
        maps.n["zr"] = { function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" }
        maps.n["zm"] = { function() require("ufo").closeFoldsWith() end, desc = "Fold more" }
        maps.n["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" }

        local opt = opts.options.opt
        opt.foldcolumn = "1"
        opt.foldexpr = "0"
        opt.foldenable = true
        opt.foldlevel = 99
        opt.foldlevelstart = 99
      end,
    },
    {
      "AstroNvim/astrolsp",
      optional = true,
      opts = function(_, opts)
        local astrocore = require "astrocore"
        if astrocore.is_available "nvim-ufo" then
          opts.capabilities = astrocore.extend_tbl(opts.capabilities, {
            textDocument = { foldingRange = { dynamicRegistration = false, lineFoldingOnly = true } },
          })
        end
      end,
    },
  },
  dependencies = { { "kevinhwang91/promise-async", lazy = true } },
  opts = {
    preview = {
      mappings = {
        scrollB = "<C-B>",
        scrollF = "<C-F>",
        scrollU = "<C-U>",
        scrollD = "<C-D>",
      },
    },
    provider_selector = function(_, filetype, buftype)
      local function handleFallbackException(bufnr, err, providerName)
        if type(err) == "string" and err:match "UfoFallbackException" then
          return require("ufo").getFolds(bufnr, providerName)
        else
          return require("promise").reject(err)
        end
      end

      return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
        or function(bufnr)
          return require("ufo").getFolds(bufnr, "treesitter")
        end
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end,
  },
}
