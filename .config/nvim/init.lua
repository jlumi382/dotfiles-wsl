-- set mapleaders before importing plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set nerd fonts to true
vim.g.have_nerd_font = true

require("config.vim-options")
require("config.keymaps")
require("config.lazy")
