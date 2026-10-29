vim.pack.add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }

local treesitter = require 'nvim-treesitter'
treesitter.setup {}
treesitter.install { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'javascript', 'typescript', 'tsx', 'c_sharp' }

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('plugins-treesitter', { clear = true }),
  callback = function(event)
    -- Use installed parsers; retain regex highlighting for Ruby and LaTeX.
    local ok = pcall(vim.treesitter.start, event.buf)
    if not ok then
      return
    end
    local ft = vim.bo[event.buf].filetype
    if ft == 'ruby' or ft == 'tex' then
      vim.bo[event.buf].syntax = ft
    end
    -- Keep the built-in indenter when the parser has no indentation query.
    local lang = vim.treesitter.language.get_lang(ft)
    if ft ~= 'ruby' and lang and vim.treesitter.query.get(lang, 'indents') then
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
