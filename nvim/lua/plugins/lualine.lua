local navic = require("nvim-navic")

require('lualine').setup {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = '•',
        icons_enabled = true,
        theme = 'base16',
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { right = '' } },
        },
        lualine_b = { 'branch', 'filename' },
        lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            },
            -- { gps.get_location, cond = gps.is_available },
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                sections = { 'error', 'warn', 'info', 'hint' },
                separator = { left = '' },
                padding = { right = 2 }
            },
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', separator = { left = '' } },
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
    tabline = {},
    extensions = { 'nvim-tree', 'fzf', 'quickfix', 'toggleterm' },
}
