-- scrolloff=999 keeps the current line vertically centered in zen mode
-- (typewriter scrolling), so we no longer have to keep hitting zz. It's set
-- window-local on the zen window, so the global scrolloff (options.lua) is
-- untouched and needs no restoring when zen closes.
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.zen = opts.zen or {}
    opts.zen.win = opts.zen.win or {}
    opts.zen.win.wo = opts.zen.win.wo or {}
    opts.zen.win.wo.scrolloff = 999
  end,
}
