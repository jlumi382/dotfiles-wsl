return {
	{
		"echasnovski/mini.hipatterns",
		version = false,
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		dependencies = { "echasnovski/mini.icons" },
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		opts = {
			mac_window_bar = false,
			code_font_family = "JetBrainsMono Nerd Font",
			has_line_number = true,
			save_path = "~/Pictures/screenshots",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
			show_workspace = true,
			watermark = "",
		},
		keys = {
			{
				"<leader>cc",
				":CodeSnap<cr>",
				mode = "x",
				desc = "CodeSnap: Save selected code snapshot into clipboard",
			},
			{
				"<leader>cs",
				":CodeSnapSave<cr>",
				mode = "x",
				desc = "CodeSnap: Save selected code snapshot in ~/Pictures/screenshots",
			},
		},
	},
	{
		"mbbill/undotree",
		opts = {},
		keys = {
			{
				"<leader>u",
				":UndotreeToggle<CR>",
				desc = "Undotree: Toggle undotree",
			},
		},
	},
    {
        "laytan/cloak.nvim",
        opts = {
            enabled = true,
            cloak_character = "*",
            highight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env",
                    },
                    cloak_pattern = "=.+",
                },
            },
        },
    },
}
