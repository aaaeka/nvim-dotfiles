vim.pack.add { { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' } }

require('neo-tree').setup {
  close_if_last_window = true,
  filesystem = {
    filtered_items = {
      visible = true,
      never_show = {
        '.DS_Store',
      },
    },
  },
}

vim.keymap.set('n', '<leader>op', '<cmd>Neotree action=show toggle=true<cr>', { desc = '[O]pen [P]roject explorer' })
