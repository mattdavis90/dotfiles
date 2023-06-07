vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.spelllang = { "en" }
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.wrap = false

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

vim.keymap.set('n', '<leader>p', ':setlocal paste!<cr>', { noremap = false, silent = true, desc = "Toggle paste mode" })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = "Unindent block" })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = "Indent block" })
vim.keymap.set('n', '<home>', '^', { noremap = false, silent = true, desc = "Goto start of line" })
vim.keymap.set('i', '<home>', '<C-O>^', { noremap = true, silent = true, desc = "Goto start of line" })

vim.g.nvim_tree_auto_ignore_ft = 'startify'
vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
