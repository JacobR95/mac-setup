--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = autogroup('HighlightYank', {})

-- general VIM
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.showtabline = 2 -- always show tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shell = "/bin/sh"

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

-- general LVIM
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight-night"
vim.g.material_style = 'deep ocean'
lvim.transparent_window = true

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.visual_mode["<C-r>"] = "\"hy:%s/<C-r>h//gc<left><left><left>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
        -- for input mode
        i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
        },
        -- for normal mode
        n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
        },
}

-- Configure builtin plugins
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
        name = "+Trouble",
        r = { "<cmd>Trouble lsp_references<cr>", "References" },
        f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
        q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
        l = { "<cmd>Trouble loclist<cr>", "LocationList" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- Move highlighted code up and down using ctrl+j/ctrl+k
lvim.keys.normal_mode["<C-j>"] = ":m .+1<CR>=="
lvim.keys.normal_mode["<C-k>"] = ":m .-2<CR>=="
lvim.keys.insert_mode["<C-j>"] = "<Esc>:m .+1<CR>==gi"
lvim.keys.insert_mode["<C-k>"] = "<Esc>:m .-2<CR>==gi"
lvim.keys.visual_mode["<C-j>"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["<C-k>"] = ":m '<-2<CR>gv=gv"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 60
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
        "bash",
        "c",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "tsx",
        "css",
        "rust",
        "java",
        "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ensure_installed = { "javascript", "typescript" }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
        { command = "flake8", filetypes = { "python" } },
        { command = "eslint", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
        {
                -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
                command = "shellcheck",
                ---@usage arguments to pass to the formatter
                -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
                extra_args = { "--severity", "warning" },
        },
        {
                command = "codespell",
                ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
                filetypes = { "javascript", "python" },
        },
}

-- Additional Plugins
lvim.plugins = {

        -- Themes
        { "folke/tokyonight.nvim" },
        { "sainnhe/gruvbox-material" },
        { "marko-cerovac/material.nvim" },

        -- Testing
        { "David-Kunz/jester" },

        -- Harpoon
        { "ThePrimeagen/harpoon" },

        {
                "ray-x/lsp_signature.nvim",
                config = function() require "lsp_signature".on_attach() end,
                event = "BufRead"
        },
        {
                "folke/trouble.nvim",
                cmd = "TroubleToggle",
        },
        { 'puremourning/vimspector' }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = { "*.lua" },
        command = "setlocal ts=8 sw=8",
})
vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*" },
        command = ":let _s=@/|:%s/\\s\\+$//e|:let @/=_s",
})
