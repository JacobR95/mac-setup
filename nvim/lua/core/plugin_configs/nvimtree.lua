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
