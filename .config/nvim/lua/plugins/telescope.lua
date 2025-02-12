return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "jmbuhr/telescope-zotero.nvim",
            dependencies = { "kkharji/sqlite.lua" },
            config = function()
                require("zotero").setup()
            end,
        },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                preview = {
                    previewer = true,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                },
                layout_config = {
                    preview_cutoff = 40,
                },
            },
            pickers = {
                man_pages = {
                    sections = { "1", "2", "3", "5", "7", "3G" }
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: [F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope: [F]ind [G]it Files" })
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope: [F]ind [S]tring" })
        vim.keymap.set("n", "<leader>fz", ":Telescope zotero<CR>", { desc = "Telescope: [F]ind [Z]otero Bibliography" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: [F]ind [H]elp [T]ags" })
        vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Telescope: [F]ind [M]an Page" })
        telescope.load_extension("ui-select")
        telescope.load_extension("zotero")
    end,
}
