vim.g.mapleader = ";"

vim.keymap.set("n","<leader>t", "<cmd>term<CR>")
vim.keymap.set("n","<leader>T", "<cmd>vsp<CR> :term<CR>")
vim.keymap.set("n","<leader>c", "<cmd>!code %:p:h<CR>")
vim.keymap.set("n","<leader>`", "<cmd>Ex<CR>")
vim.keymap.set("n","<leader>~", "<cmd>vsp<CR> :Ex<CR>")
vim.keymap.set("n","<leader>z", "<cmd>UndotreeToggle<CR>")
vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-c>", "<C-c>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<space>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
