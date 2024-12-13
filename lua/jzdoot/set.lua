-- vim.opt.formatoptions = 'cl'

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/undotree"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

vim.cmd("autocmd FileType * setlocal formatoptions=cl")
vim.cmd("command! -nargs=* W w")
vim.cmd("command! -nargs=* Wq wq")
vim.cmd("command! -nargs=* Wqa wqa")
vim.cmd("command! -nargs=* Q q")
vim.cmd("command! -nargs=* Qa qa")
