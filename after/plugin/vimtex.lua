local compile = false
vim.keymap.set("n", "<space>LT", function ()
	vim.cmd("VimtexCompile")
	vim.cmd("VimtexCompile")
	print("Compile Toggle")
end)
vim.keymap.set("n", "<space>LL", function ()
	if compile then
		vim.cmd("VimtexCompile")
		vim.cmd("VimtexClean")
		print("Compile Off")
		compile = false
	else
		vim.cmd("VimtexCompile")
		print("Compile On")
		compile = true
	end
end)--"<cmd>VimtexCompile<CR>")
vim.keymap.set("n", "<space>l", "<cmd>VimtexTocToggle<CR>")
