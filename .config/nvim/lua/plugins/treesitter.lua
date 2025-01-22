return {
    "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                    ensure_installed = {
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "lua",
                    "c",
                    "cmake",
                    "glsl",
                    "python",
                    "html",
                    "css",
                    "javascript",
                    "json",
                    "bash",
                    "latex",
                    "markdown",
                    "markdown_inline",
                    "vim",
                    "vimdoc",
                    },
                    highlight = {
                        enable = true,
                        disable = { "latex" },
                        additional_vim_regex_highlighting = { "markdown" },
                    },
                    indent = { enable = true },
            })
    end,
}
