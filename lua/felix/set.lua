--colors
vim.cmd.colorscheme("duskfox")
vim.opt.termguicolors = true

--clipboard
vim.opt.clipboard = "unnamedplus" -- system keyboard for yank's

--Line Numbering
vim.opt.nu = true
vim.opt.relativenumber = true

--Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--Line wrap
vim.opt.wrap = false

--Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

--FAST
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

--Required for undotree support
vim.o.undofile = true

--Code folding
vim.o.foldcolumn = "1"
vim.o.foldlevel = 1
vim.o.foldlevelstart = 99
vim.o.foldclose = "all"
vim.o.foldenable = true
