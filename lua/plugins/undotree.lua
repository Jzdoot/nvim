return {
	{
		"mbbill/undotree",
		config = function ()
			vim.keymap.set("n", "<leader>z", ":UndotreeToggle")
		end
	}
}
