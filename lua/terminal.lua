-- Find if there is a terminal buffer
local function findTermBuffer()
  local buf_list = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buf_list) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:sub(1, 7) == 'term://' then
      return buf
    end
  end
  return nil
end

local function isCurrentBufferTerminal()
  local current_buf = vim.api.nvim_get_current_buf()
  local buf_name = vim.api.nvim_buf_get_name(current_buf)
  return buf_name:sub(1, 7) == 'term://'
end

local function toggleTerminal()
  if isCurrentBufferTerminal() then
    vim.cmd.bp()
  else
    local term = findTermBuffer()
    if term then
      vim.api.nvim_set_current_buf(term)
    else
      vim.cmd.terminal()
    end
  end
end

-- Toggle an active terminal with the last buffer
vim.keymap.set('n', '<leader>ot', toggleTerminal, { desc = '[O]pen [T]erminal' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
