return {
  {
    'FabijanZulj/blame.nvim',
    lazy = false,
    config = function()
      require('blame').setup {
        vim.keymap.set('n', '<leader>ob', '<cmd>BlameToggle window<CR>', { desc = '[O]pen Git [B]lame' }),
      }
    end,
  },
}
