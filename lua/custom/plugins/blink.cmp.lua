return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        border = 'rounded',
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 1500,
        window = { border = 'rounded' },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust' },
  },
  opts_extend = { 'sources.default' },
}
