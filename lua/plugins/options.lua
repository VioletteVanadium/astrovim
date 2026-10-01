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
          formatoptions = "cqnj", -- This is a sequence of letters which describes how automatic formatting is to be done
          textwidth = 100,
          -- iskeyword = "@,48-57,192-255", -- treats words with `_` as multiple words
          scrolloff = 999, -- keep the current line vertically centered (typewriter scrolling); lower this for a fixed top/bottom margin instead
          showbreak = "↳ ", -- wrap indicator
          timeoutlen = 800,
          wrap = true, -- turn on line wrapping
        },
        g = {
          clipboard = {
            name = "OSC 52 through tmux",
            copy = {
              ["+"] = { "/home/victoria/.local/bin/tmux-copy-osc52" },
              ["*"] = { "/home/victoria/.local/bin/tmux-copy-osc52" },
            },
            paste = {
              ["+"] = { "sh", "-c", "tmux refresh-client -l && sleep 0.05 && tmux save-buffer -" },
              ["*"] = { "sh", "-c", "tmux refresh-client -l && sleep 0.05 && tmux save-buffer -" },
            },
            cache_enabled = 0,
          },
        },
      },
    },
  },
}
