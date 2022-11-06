local gps = require("nvim-gps")
require('lualine').setup {
    options = {
        section_separators = { left='', right='' },
        component_separators = '•',
        icons_enabled = true,
        -- theme = 'auto',
        theme = 'base16',
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { right='' } },
        },
        lualine_b = { 'branch', 'filename' },
        lualine_c = {
            { gps.get_location, cond = gps.is_available },
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                sections = { 'error', 'warn', 'info', 'hint' },
                separator = { left='' },
                padding = { right = 2 }
            },
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', separator = { left='' } },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        -- lualine_a = {},
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = {
        -- },
        -- lualine_z = {},
    },
    extensions = {'nvim-tree', 'fzf', 'quickfix', 'toggleterm'},
}

