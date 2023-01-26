vim.api.nvim_create_autocmd("FileType",{
	pattern="*",
	command="setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})
-- autocmd BufNewFile,BufReadPost *.md set filetype=markdown
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"},{
-- 	pattern="*.md",
-- 	command="setfiletype markdown"
-- })
