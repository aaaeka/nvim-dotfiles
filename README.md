# My nvim dotfiles

Personal Neovim configuration based on kickstart.nvim. Requires Neovim 0.12+.

`init.lua` contains editor options, core mappings and autocommands. Each plugin has
its own file under `lua/plugins`, with a `vim.pack.add` call and its configuration.
`lua/plugins/init.lua` registers install/update hooks and loads these files in
dependency order. Add new modules to that list after their dependencies.

On first startup, accept vim.pack's installation prompt (`a` accepts all prompts
for the session). Plugins load at startup; no external plugin manager is needed.
The generated `nvim-pack-lock.json` should be committed to preserve plugin revisions.

- Update plugins: `:lua vim.pack.update()`; review the changes and write the buffer to accept.
- Inspect plugins: `:lua vim.print(vim.pack.get())`.
- Remove a plugin: remove its module and loader entry, restart, then run
  `:lua vim.pack.del({ 'plugin-name' })`.
- See `:help vim.pack` for lockfile restoration and other management commands.

The Telescope fzf extension is enabled when `make` is available and is built on
installation/update. Treesitter requires a C compiler, `tree-sitter`, `tar`, and
`curl`; its module installs the configured parsers and the update hook refreshes them.
Mason installs configured language servers plus Prettier and StyLua. Other formatters
listed in `lua/plugins/conform.lua` must be installed separately.

The organization follows the modular approach in
[A Guide to vim.pack](https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack).
