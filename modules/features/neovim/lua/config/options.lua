-- line numbers
vim.opt.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.winborder = "rounded"

-- tab management
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- undo management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- nowrap
vim.opt.wrap = false

-- local project config
vim.o.exrc = true

-- scrolloff
local scrolloff = math.floor(vim.o.lines / 2) - 3
vim.opt.scrolloff = scrolloff

-- highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.showmatch = true

-- column
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

-- indent
vim.opt.smartindent = true
vim.opt.autoindent = true

-- ignore case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- cursor
vim.opt.guicursor = ""

-- command line
vim.opt.cmdheight = 0
