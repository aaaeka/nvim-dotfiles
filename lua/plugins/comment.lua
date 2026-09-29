vim.pack.add { 'https://github.com/numToStr/Comment.nvim' }

-- Neovim 0.12 returns nil for missing parsers instead of throwing an error.
-- Comment.nvim only checks pcall's status, so preserve its filetype fallback.
local ft = require 'Comment.ft'
local calculate = ft.calculate
ft.calculate = function(ctx)
  local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
  if not ok or not parser then
    return ft.get(vim.bo.filetype, ctx.ctype)
  end
  return calculate(ctx)
end

require('Comment').setup {}
