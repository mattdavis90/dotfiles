local util = require 'lspconfig.util'

local function switch_source_header(bufnr)
    local method_name = 'textDocument/switchSourceHeader'

    bufnr = util.validate_bufnr(bufnr)

    local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'ccls' })[1]

    if not client then
        return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
    end

    local params = vim.lsp.util.make_text_document_params(bufnr)

    client.request(method_name, params, function(err, result)
        if err then
            error(tostring(err))
        end
        if not result then
            vim.notify('corresponding file cannot be determined')
            return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
    end, bufnr)
end

vim.lsp.config("ccls", {
    cmd = { 'ccls' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {
        'compile_commands.json',
        '.ccls',
        '.git',
    },
    capabilities = {
        offset_encoding = { 'utf-32' },
    },
    -- single_file_support = false,
    on_attach = function()
        vim.api.nvim_buf_create_user_command(0, 'CclsSwitchSourceHeader', function()
            switch_source_header(0)
        end, { desc = 'Switch between source/header' })
    end,
})
vim.lsp.enable("ccls")
