-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.o.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function() vim.opt_local.formatoptions:remove { "o" } end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.cmd [[
      call SimpylFold#BufferInit()
      setlocal foldexpr=SimpylFold#FoldExpr(v:lnum)
      setlocal foldmethod=expr

      augroup SimpylFold
        autocmd TextChanged,InsertLeave <buffer> call SimpylFold#Recache()
      augroup END

      if exists('g:SimpylFold_docstring_preview') && g:SimpylFold_docstring_preview
        setlocal foldtext=foldtext()\ .\ SimpylFold#FoldText()
      endif
    ]]
  end,
})

vim.g._ts_force_sync_parsing = true

local treesitter_parsers = require "nvim-treesitter.parsers"
local treesitter_query = require "vim.treesitter.query"
--[[ Possible values (python):
(function_definition)
(class_definition)

(while_statement)
(for_statement)
(if_statement)
(with_statement)
(try_statement)

(import_from_statement)
(parameters)
(argument_list)

(parenthesized_expression)
(generator_expression)
(list_comprehension)
(set_comprehension)
(dictionary_comprehension)

(tuple)
(list)
(set)
(dictionary)

(string)
]]
if treesitter_parsers.has_parser "python" then
  local folds_query = [[
  [
  (function_definition)
  (class_definition)
  ] @fold
  ]]
  treesitter_query.set("python", "folds", folds_query)
end
if treesitter_parsers.has_parser "lua" then
  local folds_query = [[
    [
      (function_definition)
    ] @fold
  ]]
  treesitter_query.set("lua", "folds", folds_query)
end
--[[ Possible values (typescript)
  (interface_declaration)
  (internal_module)
  (function_expression)
  (function_declaration)
  (class_declaration)
  (method_definition)
  (generator_function)
  (generator_function_declaration)
  (arrow_function)

  (type_alias_declaration)
  (enum_declaration)

  (import_statement)+
  (arguments)

  (for_in_statement)
  (for_statement)
  (while_statement)
  (do_statement)
  (with_statement)
  (switch_statement)
  (switch_case)
  (switch_default)
  (if_statement)
  (try_statement)
  (catch_clause)

  (array)
  (object)
--]]
if treesitter_parsers.has_parser "tsx" then
  local folds_query = [[
    [
      (interface_declaration)
      (internal_module)
      (function_expression)
      (function_declaration)
      (class_declaration)
      (method_definition)
      (generator_function)
      (generator_function_declaration)
      (arrow_function)
    ] @fold
  ]]
  treesitter_query.set("tsx", "folds", folds_query)
end
