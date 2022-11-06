-- following example solution from github issue:
--   https://github.com/neovim/nvim-lspconfig/issues/115
function GoImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                -- note: text encoding param is required
                vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

vim.cmd [[
augroup GO_LSP
	autocmd!
	autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format({async = true})
	autocmd BufWritePre *.go :silent! lua GoImports(3000)
augroup END
]]
