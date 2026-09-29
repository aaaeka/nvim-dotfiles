vim.pack.add { 'https://github.com/projekt0n/github-nvim-theme' }

local is_dark = true
if is_dark then
  vim.cmd [[colorscheme github_dark_default]]
else
  vim.cmd [[colorscheme github_light]]
end

vim.keymap.set('n', '<leader>oc', function()
  if is_dark then
    vim.cmd [[colorscheme github_light]]
    is_dark = false
  else
    vim.cmd [[colorscheme github_dark_default]]
    is_dark = true
  end
end, { desc = 'Change [C]olorscheme' })
