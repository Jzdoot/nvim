local nnoremap = require("jzdoot.keymap").nnoremap
nnoremap("<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>")
nnoremap("<leader>M", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
