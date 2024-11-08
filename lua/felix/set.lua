--colors
vim.cmd.colorscheme("tokyonight")
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
vim.opt.colorcolumn = "80"

--Required for undotree support
vim.o.undofile = true
