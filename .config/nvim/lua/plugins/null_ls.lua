return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "jay-babu/mason-null-ls.nvim",
            "nvimtools/none-ls-extras.nvim",
            "gbprod/none-ls-shellcheck.nvim",
            "gbprod/none-ls-php.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "shellcheck",
                    "stylua",
                    "shfmt",
                    "ruff",
                    "clang-format",
                    "prettierd",
                    "eslint_d",
                    "pint",
                },
                automatic_installation = true,
            })

            local null_ls = require("null-ls")
            local sources = {
                require("none-ls-shellcheck.diagnostics"),
                require("none-ls-shellcheck.code_actions"),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
                require("none-ls.formatting.ruff_format"),
                null_ls.builtins.formatting.clang_format,
                require("none-ls.diagnostics.eslint_d"),
                require("none-ls.code_actions.eslint_d"),
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.pint,
                require("none-ls-php.diagnostics.php"),
            }

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                sources = sources,
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
