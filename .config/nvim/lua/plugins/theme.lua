return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd([[colorscheme gruvbox]])
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
