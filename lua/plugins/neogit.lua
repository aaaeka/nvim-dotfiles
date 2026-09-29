vim.pack.add { 'https://github.com/NeogitOrg/neogit' }

require('neogit').setup {}

vim.keymap.set('n', '<leader>og', '<cmd>Neogit<cr>', { desc = '[O]pen [G]it status' })
