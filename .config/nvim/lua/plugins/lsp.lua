return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LSP", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("<leader>ld", require("telescope.builtin").lsp_definitions, "Goto [D]efinition")
                    map("<leader>lr", require("telescope.builtin").lsp_references, "Goto [R]eferences")
                    map("<leader>lgi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "[T]ype Definition")
                    map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")
                    map(
                        "<leader>lws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )
                    map("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                    map("<leader>lgd", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<C-s>", vim.lsp.buf.signature_help, "[S]ignature Help", { "i", "s" })
                    map("<leader>lD", vim.diagnostic.open_float, "Hover [D]iagnostics")

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup("LSP_HIGHLIGHT", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("LSP_DETACH", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "LSP_HIGHLIGHT", buffer = event2.buf })
                            end,
                        })
                    end

                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            if vim.g.have_nerd_font then
                local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
                local diagnostic_signs = {}
                for type, icon in pairs(signs) do
                    diagnostic_signs[vim.diagnostic.severity[type]] = icon
                end
                vim.diagnostic.config({ signs = { text = diagnostic_signs } })
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                            diagnostics = { disable = { "missing-fields" } },
                        },
                    },
                },
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pyflakes = { enabled = false },
                                pycodestyle = { enabled = false },
                                autopep8 = { enabled = false },
                                yapf = { enabled = false },
                                mccabe = { enabled = false },
                                pylsp_mypy = { enabled = false },
                                pylsp_black = { enabled = false },
                                pylsp_isort = { enabled = false },
                            },
                        },
                    },
                },
                emmet_ls = {
                    filetypes = { "html", "css", "javascript", "php" },
                },
            }

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "bashls",
                "lua_ls",
                "pylsp",
                "clangd",
                "html",
                "cssls",
                "css_variables",
                "cssmodules_ls",
                "ts_ls",
                "intelephense",
                "emmet_ls",
                "texlab",
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
        keys = {
            {
                "<leader>tt",
                ":Trouble diagnostics toggle<CR>",
                desc = "Trouble: Toggle Diagnostics",
            },
            {
                "<leader>]d",
                ":Trouble diagnostics next<CR>",
                desc = "Trouble: Go to next issue",
            },
            {
                "<leader>[d",
                ":Trouble diagnostics previous<CR>",
                desc = "Trouble: Go to previous issue",
            },
        },
    },
}
