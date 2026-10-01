local directions = {
  ["<C-h>"] = "Left",
  ["<C-j>"] = "Down",
  ["<C-k>"] = "Up",
  ["<C-l>"] = "Right",
  ["<C-\\>"] = "Previous",
}

return {
  "christoomey/vim-tmux-navigator",
  -- The plugin's own terminal-mode maps are written for Vim, where <C-w> is the
  -- terminal window prefix. Neovim has no such default, so it forwards the whole
  -- rhs to the running program and ":TmuxNavigateUp<CR>" gets typed into it.
  -- Own every mapping instead, and drive navigation from a callback so the
  -- terminal buffer never leaves terminal mode.
  init = function()
    vim.g.tmux_navigator_disable_netrw_workaround = 1
    vim.g.tmux_navigator_no_mappings = 1

    for key, direction in pairs(directions) do
      vim.keymap.set("n", key, "<cmd>TmuxNavigate" .. direction .. "<cr>", { silent = true })
      vim.keymap.set("t", key, function()
        -- fzf binds C-j/C-k itself; leave its keys to it.
        if vim.fn.exists("*IsFZF") == 1 and vim.fn.IsFZF() == 1 then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", false)
          return
        end
        vim.cmd("TmuxNavigate" .. direction)
      end, { silent = true })
    end
  end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
}
