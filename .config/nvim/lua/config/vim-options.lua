-- good old cursor
vim.opt.guicursor = ""

-- enable number line and relative number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- tabs & indention format
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.smartindent = true

-- disable swap file
vim.opt.swapfile = false
vim.opt.backup = false

-- create undo file
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- cursor in middle
vim.opt.scrolloff = 15

-- turn off curor line
vim.opt.cursorline = false

-- always show sign column
vim.opt.signcolumn = "yes"

-- include - and @ as a filename character
vim.opt.isfname:append("@-@")

-- lower update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- column guide
vim.opt.colorcolumn = "80"

vim.opt.inccommand = 'split'

-- show tabs always
vim.opt.showtabline = 2

-- enable spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- netrw options
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
