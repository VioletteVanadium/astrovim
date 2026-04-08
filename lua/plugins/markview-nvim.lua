return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  ft = {
    "md",
    "markdown",
    "norg",
    "rmd",
    "org",
    "vimwiki",
    "typst",
    "tex",
    "quarto",
  },
  opts = {
    preview = {
      filetypes = {
        "md",
        "markdown",
        "norg",
        "rmd",
        "org",
        "vimwiki",
        "typst",
        "tex",
        "quarto",
      },
      ignore_buftypes = {},
    },
    markdown = {
      list_items = {
        indent_size = 1,
        shift_width = 1,
      },
    },
  },
  config = function(_, opts)
    require("markview.extras.checkboxes").setup()
    require("markview").setup(opts)
  end,
}
