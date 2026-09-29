vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }
require 'plugins.neodev'

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [d]efinition')

    map('gD', function()
      vim.cmd 'vsplit'
      require('telescope.builtin').lsp_definitions()
    end, '[G]oto [D]efinition in right split')

    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

local servers = {
  pyright = {},
  eslint = {},
  texlab = {},
  lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
}
local capabilities = require('blink.cmp').get_lsp_capabilities()
for name, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(name, config)
end
require('mason-lspconfig').setup { ensure_installed = vim.tbl_keys(servers) }
require('mason-tool-installer').setup { ensure_installed = { 'prettier', 'stylua' } }
