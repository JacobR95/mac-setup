-- general VIM
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.background = 'dark'
vim.opt.guifont = 'monospace:h17' -- the font used in graphical neovim applications
vim.opt.showtabline = 2 -- always show tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shell = '/bin/sh'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd('BufWinEnter', {
        pattern = { '*.lua' },
        command = 'setlocal ts=8 sw=8',
})
vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*' },
        command = ':let _s=@/|:%s/\\s\\+$//e|:let @/=_s',
})
