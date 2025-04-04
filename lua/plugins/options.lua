return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          autoread = true, -- promt to reload buffor when external change is detected
          clipboard = "",
          fillchars = {
            -- thicker split borders
            horiz = "━",
            horizup = "┻",
            horizdown = "┳",
            vert = "┃",
            vertleft = "┫",
            vertright = "┣",
            verthoriz = "╋",
          },
          foldexpr = "nvim_treesitter#foldexpr()",
          foldmethod = "expr",
          foldlevel = 1,
          formatoptions = "cqnj", -- This is a sequence of letters which describes how automatic formatting is to be done
          -- iskeyword = "@,48-57,192-255", -- treats words with `_` as multiple words
          scrolloff = 4, -- minimal number of screen lines to keep above and below the cursor
          showbreak = "↳ ", -- wrap indicator
          timeoutlen = 800,
          wrap = true, -- turn on line wrapping
        },
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
          -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
          -- This can be found in the `lua/lazy_setup.lua` file
        },
      },
    },
  },
}
