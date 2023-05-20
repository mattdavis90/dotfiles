local cmp = require('cmp')

if cmp == nil then
    return
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<TAB>'] = cmp.mapping.select_next_item(),
        ['<S-TAB>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'treesitter' },
    }),
    formatting = {
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp   = " lsp   ",
                    vsnip      = " vsnip ",
                    buffer     = " buffer",
                    path       = " path  ",
                    treesitter = " tree  ",
                })[entry.source.name]
                return vim_item
            end
        })
    },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
