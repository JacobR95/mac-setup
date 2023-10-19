-- Theme config
vim.o.termguicolors = true
vim.cmd [[ colorscheme gruvbox ]]
vim.o.termguicolors = true
vim.o.background = "dark"

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}

-- Copilot
--highlight gray
--highlight gray guifg=#5c6370
vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]

-- Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "vim", "java", "typescript", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

-- Telescope
require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NVIM Tree
require('nvim-tree').setup({
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  view = {
    width = 45,
  }
})
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')
