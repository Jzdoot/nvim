vim.api.nvim_create_autocmd("BufEnter",{
	pattern="github.com_*_.txt",
	command="set filetype=markdown"
})
-- 	au BufEnter replit.com_*.txt set filetype=java
vim.api.nvim_create_autocmd("BufEnter",{
	pattern="replit.com_*_.txt",
	command="set filetype=java"
})
