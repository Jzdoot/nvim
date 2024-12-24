return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			}
		})
		vim.keymap.set("n", "<leader>`", vim.cmd.Oil)
	end
}
