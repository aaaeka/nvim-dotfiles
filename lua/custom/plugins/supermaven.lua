return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<C-;>',
        clear_suggestion = '<C-]>',
        accept_word = '<C-j>',
      },
      disable_keymaps = false,
    }
  end,
}
