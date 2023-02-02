vim.keymap.set("n", "<leader>g", vim.cmd.Git)
vim.keymap.set("n", "<leader>Gg", vim.cmd.Git)
vim.keymap.set("n", "<leader>Gp", function () vim.cmd("Git push") end)
