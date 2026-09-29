vim.pack.add { 'https://github.com/FabijanZulj/blame.nvim' }

require('blame').setup {}
vim.keymap.set('n', '<leader>ob', '<cmd>BlameToggle window<CR>', { desc = '[O]pen Git [B]lame' })
