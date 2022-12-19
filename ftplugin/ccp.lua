-- vim.o.signcolumn = yes
-- vim.o.makeprg = "gcc\ %"
vim.keymap.set("n","<leader>r", "<cmd>term ./a.out<cr>")
vim.keymap.set("n","<leader>rm", "<cmd>make<cr> :term ./a.out;rm -rf *.out<cr>")
