return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon: Add to list",
        },
        {
            "<C-e>",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Harpoon: Toggle quick menu",
        },
        {
            "<C-p>",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "Harpoon: Go to previous item in list",
        },
        {
            "<C-n>",
            function()
                require("harpoon"):list():next()
            end,
            desc = "Harpoon: Go to next item in list",
        },
    },
}
