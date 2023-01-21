vim.keymap.set("n", "<space>pw", function() require('pommodoro-clock').start("work") end);
vim.keymap.set("n", "<space>ps", function() require('pommodoro-clock').start("short_break") end);
vim.keymap.set("n", "<space>pl", function() require('pommodoro-clock').start("long_break") end);
vim.keymap.set("n", "<space>pp", function() require('pommodoro-clock').toggle_pause() end);
vim.keymap.set("n", "<space>pc", function() require('pommodoro-clock').close() end);
