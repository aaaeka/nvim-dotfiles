vim.pack.add { 'https://github.com/folke/which-key.nvim' }

require('which-key').setup {}
local wk = require 'which-key'
wk.add {
  { '<leader>a', group = '[A]vante' },
  { '<leader>a_', hidden = true },
  { '<leader>c', group = '[C]ode' },
  { '<leader>c_', hidden = true },
  { '<leader>d', group = '[D]ocument' },
  { '<leader>d_', hidden = true },
  { '<leader>h', group = '[H]arpoon' },
  { '<leader>h_', hidden = true },
  { '<leader>o', group = '[O]pen' },
  { '<leader>o_', hidden = true },
  { '<leader>r', group = '[R]ename' },
  { '<leader>r_', hidden = true },
  { '<leader>s', group = '[S]earch' },
  { '<leader>s_', hidden = true },
  { '<leader>w', group = '[W]orkspace' },
  { '<leader>w_', hidden = true },
}
