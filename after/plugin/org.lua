require('orgmode').setup({
	org_agenda_files = {'~/org'},
	org_default_notes_file = '~/org/todo.org',
})
require("org-bullets").setup {
	concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
	symbols = {
		-- headlines can be a list
		headlines = { "◉", "○", "✸", "✿" },
		-- or a function that receives the defaults and returns a list
		-- headlines = function(default_list)
		-- 	table.insert(default_list, "♥")
		-- 	return default_list
		-- end,
		-- checkboxes = {
		-- 	half = { "", "OrgTSCheckboxHalfChecked" },
		-- 	done = { "✓", "OrgDone" },
		-- 	todo = { "˟", "OrgTODO" },
		-- },
	}
}
-- Kemaps
vim.keymap.set("n", "<space>w",function () vim.cmd("e ~/org/notes.org") end)
vim.keymap.set("n", "<space>W",function ()
	vim.cmd("vsplit")
	vim.cmd("e ~/org/notes.org")
end)
vim.keymap.set("n", "<space>t",function () vim.cmd("e ~/org/todo.org") end)
vim.keymap.set("n", "<space>T",function ()
	vim.cmd("vsplit")
	vim.cmd("e ~/org/todo.org")
end)
vim.keymap.set("n", "<space><CR>", function ()
	vim.o.mapleader = " "

end)
