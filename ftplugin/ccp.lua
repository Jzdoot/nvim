local nnoremap = require("jzdoot.keymap").nnoremap
vim.o.signcolumn = yes
vim.o.makeprg = "gcc\ %"
nnoremap("<leader>r", "<cmd>term ./a.out<cr>")
nnoremap("<leader>rm", "<cmd>make<cr> :term ./a.out;rm -rf *.out<cr>")
