vim.g.python_host_prog = '/home/matt/.virtualenvs/neovim/bin/python'
vim.g.python3_host_prog = '/home/matt/.virtualenvs/neovim3/bin/python3'

vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.wildmenu = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.splitkeep = "screen"

require("settings.keymap")
require("settings.completion")
