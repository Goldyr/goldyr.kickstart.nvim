return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      local harpoon_extensions = require 'harpoon.extensions'
      --Highlighs in quick menu
      harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
      --Lets you navigate with numbers in the quick menu
      harpoon:extend(harpoon_extensions.builtins.navigate_with_number())

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add to harpoon list' })

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle harpoon menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: go to 1' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: go to 2' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: go to 3' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: go to 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-p>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():next()
      end)
    end,
  },
}
