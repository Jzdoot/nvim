local compile = false
local function status()
	if compile then
		print("Compile Status On")
	else
		print("Compile Status Off")
	end
end
local function toggleCompile()
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
end
local function toggle()
	if compile then
		vim.cmd("VimtexCompile")
		vim.cmd("VimtexCompile")
		print("Compile Toggle")
	else
		print("Compile is turned off")
	end
end
vim.g.vimtex_view_method = "skim"
vim.keymap.set("n", "<space>VT", toggle)
vim.keymap.set("n", "<space>VV", toggleCompile)--"<cmd>VimtexCompile<CR>")
vim.keymap.set("n", "<space>VS", status)
vim.keymap.set("n", "<space>v", "<cmd>VimtexTocToggle<CR>")
vim.keymap.set("n", "<space>VG", function () vim.cmd("VimtexView") end)

-- vim.api.nvim_create_autocmd("BufEnter",{
-- 	pattern="*.tex",
-- 	callback=function ()
-- 		if not compile then
-- 			vim.cmd("VimtexCompile")
-- 			compile=true
-- 		end
-- 	end
-- })
-- vim.api.nvim_create_autocmd("BufLeave",{
-- 	pattern="*.tex",
-- 	callback=function ()
-- 		if compile then
-- 			vim.cmd("VimtexCompile")
-- 			compile=false
-- 		end
-- 	end
-- })
-- vim.api.nvim_create_autocmd("BufWritePost",{
-- 	pattern="*.tex",
-- 	callback=toggle
-- })
