return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      print 'Added file to harpoon list'
      harpoon:list():add()
    end, { desc = 'Mark file' })
    vim.keymap.set('n', '<leader>hc', function()
      print 'Cleared harpoon list'
      harpoon:list():clear()
    end, { desc = 'Clear harpoon list' })
    vim.keymap.set('n', '<leader>hx', function()
      print 'Removed file from harpoon list'
      harpoon:list():remove()
    end, { desc = 'Remove current file from harpoon' })
    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end, { desc = 'Go to first [1] marked file' })
    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end, { desc = 'Go to first [2] marked file' })
    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end, { desc = 'Go to first [3] marked file' })
    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end, { desc = 'Go to first [4] marked file' })
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = 'Go to previous marked filed' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = 'Go to next marked file' })

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = false,
          layout_config = {
            width = 0.4,
            height = 0.3,
          },
        })
        :find()
    end

    vim.keymap.set('n', '<leader>sm', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open marked file list' })
  end,
}
