return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "shfmt",
                    "ruff",
                    "clang-format",
                    "prettier",
                },
                automatic_installation = true,
            })

            local null_ls = require("null-ls")
            local sources = {
                null_ls.builtins.formatting.shfmt,
                require("none-ls.formatting.ruff").with { extra_args = { '--extend-select', 'I' } },
                require("none-ls.formatting.ruff_format"),
                null_ls.builtins.formatting.clang_format,
                require("none-ls.diagnostics.eslint_d"),
                require("none-ls.code_actions.eslint_d"),
                null_ls.builtins.formatting.prettier,
            }

            -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            -- null_ls.setup({
            --     sources = sources,
            --     on_attach = function(client, bufnr)
            --         if client.supports_method("textDocument/formatting") then
            --             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            --             vim.api.nvim_create_autocmd("BufWritePre", {
            --                 group = augroup,
            --                 buffer = bufnr,
            --                 callback = function()
            --                     vim.lsp.buf.format({ async = false })
            --                 end,
            --             })
            --         end
            --     end,
            -- })
        end
    }
}
