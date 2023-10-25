require('core.set')
require('core.remaps')
require('core.plugins')
require('core.plugin_configs')
require('core.plugin_configs/init')

local augroup = vim.api.nvim_create_augroup
local MyGroup = augroup('Group', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = MyGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
