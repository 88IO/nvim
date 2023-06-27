vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '',
  command = ':%s/\\s\\+$//ge'
});

-- encoding
vim.o.encofing = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.modifiable = true
vim.o.write = true
vim.o.tags = 'tags'

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.listchars  = { tab = '»-', trail = '-', extends = '»', precedes = '«', nbsp = '%', eol = '↲' }
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 3


-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- manipulation
vim.g.mapleader = ' '
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

--vim.o.undofile = true
--vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.keymap.set('n', '<Esc><Esc>', ':nohl<CR>', { silent = true})
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', ':', ';')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<Leader>ww', ':w<CR>', { silent = true })
vim.keymap.set('n', '<Leader>qq', ':q!<CR>', { silent = true })
vim.keymap.set('n', '<Leader>wq', ':wq<CR>', { silent = true })
vim.keymap.set('n', '<Leader>qa', ':qa!<CR>', { silent = true })
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('c', '/', function()
    return vim.fn.getcmdtype() == '/' and '/' or '/' end, { expr = true })
vim.keymap.set('c', '?', function()
    return vim.fn.getcmdtype() == '?' and '>?' or '?' end, { expr = true })
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'gk', 'k')

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

plugins = require('plugins')

require('lazy').setup(plugins)
