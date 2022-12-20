vim.g.copilot_enabled = false
local cp = false
vim.keymap.set("n","<space>c", function ()
	if cp then
		cp = false
		print("Copilot off")
	else
		cp = true
		print("Copilot on")
	end
	vim.g.copilot_enabled = cp
end)
