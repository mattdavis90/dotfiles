return {
    {
        'saghen/blink.cmp',
        event = "BufEnter",
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            keymap = {
                preset = "default",
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'normal',
            },
            completion = {
                list = { selection = 'auto_insert' },
                menu = {
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind" },
                        },
                    },
                },
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
                ghost_text = { enabled = true },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                cmdline = {},
            },
        }
    },
}
