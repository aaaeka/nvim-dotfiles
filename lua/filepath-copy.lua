local function copyFilePathToClipboard()
  local path = vim.fn.expand '%:.'
  if path == '' then
    vim.api.nvim_echo({ { 'Current buffer has no file path' } }, false, {})
    return
  end

  vim.fn.setreg('+', path)
  vim.api.nvim_echo({ { string.format('Path `%s` copied to clipboard', path) } }, false, {})
end

vim.keymap.set('n', '<leader>dc', copyFilePathToClipboard, { desc = '[C]opy file path' })
