vim.g.mapleader = ";"

vim.keymap.set("n", "<leader>`", "<cmd>Ex<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-c>", "<C-c>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "`", "~<left>")

vim.keymap.set("n", "<space><tab>", "I	<escape>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<c-n>", "<c-x><c-i>")

vim.keymap.set("v", "p", "pyy")

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set({ "n", "i" }, "<esc>", "<esc>")

vim.keymap.set("n", "<f1>", function()
	if vim.bo.ft == "help" then
		vim.cmd("q")
	else
		vim.cmd("help")
	end
end)
--running lua
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<space>X", ":%lua<CR>")
--TODO: Quick fix time
vim.keymap.set("n", "<leader>o", function()
	if vim.bo[vim.api.nvim_get_current_buf()].ft == "qf" then
		vim.cmd.cclose()
	else
		vim.cmd.copen()
	end
end)
vim.keymap.set({ "n", "i" }, "<c-]>", vim.cmd.cnext)
vim.keymap.set({ "n", "i" }, "<c-[>", vim.cmd.cprevious)
