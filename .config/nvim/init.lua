vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual

-- 24bit RGB color
vim.api.nvim_set_option('termguicolors', true)

-- scroll from 4 lines back
vim.api.nvim_set_option('scrolloff', 4)

-- if contains upper case, search by perfect matching
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)

-- replace with preview
vim.api.nvim_set_option('inccommand', 'split')

-- use clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- show line number
vim.api.nvim_win_set_option(0, 'number', true)

-- highlight cursor line
vim.api.nvim_win_set_option(0, 'cursorline', true)

vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')

-- Number of spaces that a <Tab>
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = '*',
    group = vim.api.nvim_create_augroup('buffer_set_options', {}),
    callback = function()
        vim.api.nvim_buf_set_option(0, 'tabstop', 4)
        vim.api.nvim_buf_set_option(0, 'shiftwidth', 0)
        vim.api.nvim_buf_set_option(0, 'expandtab', true)
    end,
})

vim.o.clipboard = 'unnamedplus'
--vim.o.ambiwidth = 'double'
vim.o.pumblend = 20
vim.o.winblend = 30
vim.o.softtabstop = 4
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- search
vim.o.incsearch = true
--vim.o.hlsearch = true
vim.keymap.set('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true })

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

-- manipulation
vim.g.mapleader = ' '
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.api.nvim_set_var('mapleader', ' ')
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'gj', 'j', { noremap = true })
vim.keymap.set('n', 'gk', 'k', { noremap = true })
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')
vim.keymap.set('n', 's', '"_s')
vim.keymap.set("n", "<C-k>", ":bnext<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":bprevious<Return>", { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>s', ':split<Return><C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>v', ':vsplit<Return><C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h')
--vim.keymap.set('n', 'sk', '<C-w>k')
--vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<Leader>r', ':source ~/.config/nvim/init.lua<Return>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>w', ':w<Return>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>q', ':q<Return>', { noremap = true, silent = true })

-- plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require('plugins')

require('lazy').setup(plugins)
