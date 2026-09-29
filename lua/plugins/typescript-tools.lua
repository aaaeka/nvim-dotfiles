vim.pack.add { 'https://github.com/pmizio/typescript-tools.nvim' }

require('typescript-tools').setup {
  settings = {
    tsserver_plugins = {
      '@styled/typescript-styled-plugin',
    },
  },
}
