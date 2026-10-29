assert(vim.fn.has 'nvim-0.12' == 1, 'This config requires Neovim 0.12 or newer (vim.pack)')

-- Register hooks before any add(): a lockfile can install all plugins at once.
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('plugins-pack-changed', { clear = true }),
  callback = function(event)
    local plugin = event.data
    if plugin.kind == 'delete' then
      return
    end
    if plugin.spec.name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      local result = vim.system({ 'make' }, { cwd = plugin.path, text = true }):wait()
      if result.code ~= 0 then
        error('telescope-fzf-native build failed: ' .. (result.stderr or ''))
      end
    elseif plugin.spec.name == 'nvim-treesitter' and plugin.kind == 'update' then
      if not plugin.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      require('nvim-treesitter').update()
    end
  end,
})

-- Dependencies precede their consumers; the theme precedes UI setup.
for _, plugin in ipairs {
  'plenary',
  'devicons',
  'nui',
  'coop',
  'friendly-snippets',
  'cmp',
  'theme',
  'sleuth',
  'comment',
  'gitsigns',
  'which-key',
  'telescope-fzf-native',
  'telescope-ui-select',
  'telescope-undo',
  'telescope',
  'blink',
  'mason',
  'mason-lspconfig',
  'mason-tool-installer',
  'fidget',
  'lsp',
  'conform',
  'todo-comments',
  'treesitter',
  'diffview',
  'neogit',
  'coerce',
  'autopairs',
  'blame',
  'filetree',
  'harpoon',
  'lualine',
  'typescript-tools',
  'vimtex',
  'dap',
  'dap-view',
} do
  require('plugins.' .. plugin)
end
