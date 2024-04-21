--Fat cursor
--vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursosm:block-blinkwait175-blinkoff150-blinkon175r"

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

--Undo
vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("User") .. "/.vim/undodir"
vim.opt.undofile = true

--Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

--COLORS
vim.opt.termguicolors = true

--Scrolloff
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--FAST
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

