require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
      },
      n = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
    },
    grep_string = {
      only_sort_text = true,
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    git_files = {
      hidden = true,
      show_untracked = true,
    },
    colorscheme = {
      enable_preview = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                                     -- false will only do exact matching
      override_generic_sorter = true,                   -- override the generic sorter
      override_file_sorter = true,                      -- override the file sorter
      case_mode = "smart_case",                         -- or "ignore_case" or "respect_case"
    },
  },
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
