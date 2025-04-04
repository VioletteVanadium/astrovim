-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function() vim.opt_local.formatoptions:remove { "o" } end,
})

local pipepath = vim.fn.stdpath "cache" .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then vim.fn.serverstart(pipepath) end
