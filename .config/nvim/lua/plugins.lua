local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.api.nvim_command 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('packer').init({ display = { auto_clean = false } })

require('packer').startup(function(use)
    -- Load lua path
    local lua_path = function(name)
        return string.format("require'plugins.%s'", name)
    end

    -- Packer managing itself
    use { 'wbthomason/packer.nvim' }

    -- Theme
    use { 'sainnhe/sonokai', config = function()
        vim.cmd("colorscheme sonokai")
    end }

    -- Language Server
    use { 'neovim/nvim-lspconfig' }
    use { 'onsails/lspkind-nvim', config = lua_path("lspkind") }
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
    use { "folke/trouble.nvim", config = lua_path("trouble") }
    use { 'gbrlsnchs/telescope-lsp-handlers.nvim' }

    -- Completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'ray-x/cmp-treesitter' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'andymass/vim-matchup', config = lua_path("vim-matchup") }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path("treesitter") }
    use { 'lukas-reineke/indent-blankline.nvim', config = lua_path("indent-blankline") }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig", config = lua_path("nvim-navic") }

    -- Syntax
    use { 'junegunn/vim-easy-align' }

    -- Icons
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'ryanoasis/vim-devicons' }

    -- Status bar
    use { 'nvim-lualine/lualine.nvim', config = lua_path("lualine") }

    -- Clipboard
    use { 'AckslD/nvim-neoclip.lua', config = lua_path("nvim-neoclip") }

    -- Style notifications
    use { 'rcarriga/nvim-notify', config = lua_path("nvim-notify") }

    -- Interactive file popup
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', after = { "nvim-neoclip.lua", "nvim-notify" }, config = lua_path("telescope") }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'nvim-telescope/telescope-project.nvim' }

    -- File Explorer
    use { 'kyazdani42/nvim-tree.lua', config = lua_path("nvim-tree") }

    -- Git
    use { 'lewis6991/gitsigns.nvim', config = lua_path("gitsigns") }

    -- Start where you left off
    use { 'farmergreg/vim-lastplace' }

    -- Floating terminal and LazyGit
    use { 'akinsho/toggleterm.nvim', config = lua_path("toggleterm") }

    -- Peek at lines
    use { 'nacro90/numb.nvim', config = lua_path("numb") }

    -- Tpope
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }

    -- Change root directory to working directory (typically .git)
    use { 'airblade/vim-rooter', config = lua_path("vim-rooter") }

    -- Toggle between absolute and relative numbering automatically
    use { 'jeffkreeftmeijer/vim-numbertoggle' }

    -- Highlight Todo and similar comments
    use { 'folke/todo-comments.nvim', config = lua_path("todo-comments") }

    -- Create REST calls from HTTP files
    use { 'NTBBloodbath/rest.nvim' }

    -- Highlight instances of the current word
    use { 'RRethy/vim-illuminate' }

    -- The greeter screen when no file is chosen
    use { 'goolord/alpha-nvim', config = lua_path("alpha-nvim") }

    -- Display a hint for the keyboard shortcuts
    use { 'folke/which-key.nvim', config = lua_path("which-key") }

    -- Display a scrollbar with position and errors
    use { 'petertriho/nvim-scrollbar', after = "gitsigns.nvim", config = lua_path("nvim-scrollbar") }

    -- Search plugin with N/M annotion - hooks into scrollbar
    use { 'kevinhwang91/nvim-hlslens', after = "nvim-scrollbar", config = lua_path("hlslens") }

    -- Smart list of buffers
    use { 'matbme/JABS.nvim', config = lua_path("jabs") }

    -- Code minimap
    use { 'gorbit99/codewindow.nvim', config = lua_path("codewindow") }

    -- Have packer bootstrap itself
    if packer_bootstrap then
        require('packer').sync()
    end
end)
