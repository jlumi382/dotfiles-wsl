return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
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
            "php",
            "phpdoc",
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
        auto_install = true,
    },
}
