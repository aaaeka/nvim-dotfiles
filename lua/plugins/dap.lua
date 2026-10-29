vim.pack.add { 'https://github.com/mfussenegger/nvim-dap' }

local dap = require 'dap'

local function highlight_dap_marks()
  vim.api.nvim_set_hl(0, 'DapMark', { fg = '#ff3333', ctermfg = 9, bold = true })
end

highlight_dap_marks()
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('dap-mark-highlights', { clear = true }),
  callback = highlight_dap_marks,
})

for _, name in ipairs { 'DapBreakpoint', 'DapBreakpointCondition', 'DapBreakpointRejected', 'DapLogPoint', 'DapStopped' } do
  local sign = vim.fn.sign_getdefined(name)[1]
  vim.fn.sign_define(name, { text = sign.text, texthl = 'DapMark', linehl = sign.linehl, numhl = sign.numhl })
end

vim.keymap.set('n', '<leader>dn', '<cmd>DapNew<CR>', { desc = '[D]ebug [N]ew session' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = '[D]ebug [T]erminate' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>dd', dap.clear_breakpoints, { desc = '[D]ebug clear all breakpoints' })
vim.keymap.set('n', '<leader>dr', function()
  dap.repl.open({}, 'botright vsplit')
end, { desc = '[D]ebug [R]EPL' })

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/netcoredbg',
  args = { '--interpreter=vscode' },
}

local config = {
  {
    type = 'coreclr',
    name = 'attach - netcoredbg',
    request = 'attach',
    processId = require('dap.utils').pick_process,
  },
}

dap.configurations.cs = config
dap.configurations.fsharp = config
