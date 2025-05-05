---@type LazySpec
return {
  "ray-x/lsp_signature.nvim",
  event = "User AstroFile",
  main = "lsp_signature",
  opts = {
    floating_window = false,
    hint_enable = true,
    hint_prefix =  {
      above = "↙ ",
      current = "← ",
      below = "↖ ",
    },
    doc_lines = 0,
    toggle_key = '<C-x>',
    select_signature_key = '<C-s>',
    move_signature_window_key = {'<C-j>', '<C-k>'},
    move_cursor_key = '<C-a>',
  },
  specs = {
    {
      "folke/noice.nvim",
      optional = true,
      ---@type NoiceConfig
      opts = {
        lsp = {
          signature = { enabled = false },
          hover = { enabled = false },
        },
      },
    },
    { "AstroNvim/astrolsp", optional = true, opts = { features = { signature_help = false } } },
  },
}
