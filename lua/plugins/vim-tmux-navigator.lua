return {
  "christoomey/vim-tmux-navigator",
  init = function() vim.g.tmux_navigator_disable_netrw_workaround = 1 end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    -- -- Terminal mode: escape terminal first, then navigate
    -- { "<c-h>", "<C-\\><C-n><cmd>TmuxNavigateLeft<cr>", mode = "t" },
    -- { "<c-j>", "<C-\\><C-n><cmd>TmuxNavigateDown<cr>", mode = "t" },
    -- { "<c-k>", "<C-\\><C-n><cmd>TmuxNavigateUp<cr>", mode = "t" },
    -- { "<c-l>", "<C-\\><C-n><cmd>TmuxNavigateRight<cr>", mode = "t" },
    -- { "<c-\\>", "<C-\\><C-n><cmd>TmuxNavigatePrevious<cr>", mode = "t" },
  },
}
