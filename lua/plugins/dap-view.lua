vim.pack.add {
  { src = 'https://github.com/igorlfs/nvim-dap-view', version = vim.version.range '1.*' },
}

require('dap-view').setup {
  virtual_text = {
    enabled = true,
    position = 'inline',
  },
  windows = {
    position = 'right',
  },
}

vim.keymap.set('n', '<leader>od', '<cmd>DapViewToggle<CR>', { desc = '[O]pen [D]ebugger' })
