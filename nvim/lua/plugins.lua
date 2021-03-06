local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})


require('packer').startup(function()
    -- Load lua path
    local lua_path = function(name)
        return string.format("require'plugins.%s'", name)
    end

    -- Packer managing itself
    use { 'wbthomason/packer.nvim' }

    -- Theme
    use { 'chriskempson/base16-vim', config = lua_path"base16" }

    -- Language Server
    use { 'neovim/nvim-lspconfig' }
    use { 'onsails/lspkind-nvim', config = lua_path"lspkind" }
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
    use { "folke/trouble.nvim", config = lua_path"trouble" }

    -- -- Completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'ray-x/cmp-treesitter' }
    use { 'quangnguyen30192/cmp-nvim-tags' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'andymass/vim-matchup', config = lua_path"vim-matchup" }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
    use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'romgrk/nvim-treesitter-context' }
    use { 'SmiteshP/nvim-gps', config = lua_path"nvim-gps" }

    -- Syntax
    use { 'junegunn/vim-easy-align' }

    -- Icons
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'ryanoasis/vim-devicons' }

    -- Status bar
    use { 'nvim-lualine/lualine.nvim', config = lua_path"lualine" }

    -- Interactive file popup
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }

    -- File Explorer
    use { 'kyazdani42/nvim-tree.lua', config = lua_path"nvim-tree" }

    -- Git
    use { 'lewis6991/gitsigns.nvim', config = lua_path"gitsigns" }

    -- Start where you left off
    use { 'farmergreg/vim-lastplace' }

    -- Floating terminal and LazyGit
    use { 'akinsho/toggleterm.nvim', config = lua_path"toggleterm" }

    -- Registers & clipboard
    use { 'tversteeg/registers.nvim' }
    use { 'AckslD/nvim-neoclip.lua', config = lua_path"nvim-neoclip" }

    -- Peek at lines
    use { 'nacro90/numb.nvim', config = lua_path"numb" }

    -- Tpope
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }

    -- Tags
    use { 'ludovicchabant/vim-gutentags', config = lua_path"vim-gutentags" }

    -- General Plugins
    use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
    use { 'airblade/vim-rooter', config = lua_path"vim-rooter" }
    use { 'mhinz/vim-startify' }
    use { 'jeffkreeftmeijer/vim-numbertoggle' }
    use { 'folke/todo-comments.nvim', config = lua_path"todo-comments" }
    use { 'luukvbaal/stabilize.nvim', config = lua_path"stabilize" }

    -- Have packer bootstrap itself
    if packer_bootstrap then
        require('packer').sync()
    end
end)
