-- Update the terminal title to current dir
-- We can split a path to the directory and the file.
local function split(path)
  return path:match '(.*/)(.*)'
end

vim.opt.title = true
local function updateTitlestring()
  local cwd = vim.fn.getcwd()
  local _, basename = split(cwd)

  vim.opt.titlestring = string.format('%s - nvim', basename)
end
updateTitlestring()

vim.api.nvim_create_autocmd('DirChanged', {
  desc = 'Change terminal title on directory change',
  group = vim.api.nvim_create_augroup('kickstart-update-title', { clear = true }),
  callback = updateTitlestring,
})
