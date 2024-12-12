vim.api.nvim_create_autocmd("FileType",{
	pattern="*",
	-- command="setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
	-- command= function () 
	-- 	vim.opt.formatoptions = 'cl'
	-- end
})
