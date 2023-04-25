vim.keymap.set("n", "<leader>g", vim.cmd.Git)
vim.keymap.set("n", "<leader>GG", vim.cmd.Git)
vim.keymap.set("n", "<leader>GP", function () vim.cmd("Git push") end)
