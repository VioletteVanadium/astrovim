---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      'black',
      'flake8',
      'isort',
      'jedi-language-server',
      'mypy',
      'typescript-language-server',
      'prettierd',
      'eslint_d'
    }
  }
}
