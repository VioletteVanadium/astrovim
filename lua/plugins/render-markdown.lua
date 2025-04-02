return {
  "render-markdown.nvim",
  opts = {
    anti_conceal = {
      -- Which elements to always show, ignoring anti conceal behavior. Values can either be booleans
      -- to fix the behavior or string lists representing modes where anti conceal behavior will be
      -- ignored. Possible keys are:
      --  head_icon, head_background, head_border, code_language, code_background, code_border
      --  dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
      ignore = {
        head_icon = true,
        head_background = true,
        head_border = true,
        code_language = true,
        code_background = true,
        code_border = true,
        dash = true,
        bullet = true,
        check_icon = true,
        check_scope = true,
        quote = true,
        table_border = true,
        callout = true,
        link = true,
        sign = true,
      },
    },
  },
}
