-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function() vim.opt_local.formatoptions:remove { "o" } end,
})

-- vim.g._ts_force_sync_parsing = true

local treesitter_parsers = require "nvim-treesitter.parsers"
local treesitter_query = require "vim.treesitter.query"
--[[ Possible values:
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
