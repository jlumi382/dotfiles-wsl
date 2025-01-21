return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = true })
        end,
    },
}
