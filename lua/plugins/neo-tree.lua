return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      buffers = {
        follow_current_file = { enabled = true },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = { enabled = true },
      },
      event_handlers = {
        -- auto close
        {
          event = "file_open_requested",
          handler = function() require("neo-tree.command").execute { action = "close" } end,
        },
      },
      sort_case_insensitive = true,
    },
  },
}
