return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			{
				"lewis6991/gitsigns.nvim",
				config = function()
					require('gitsigns').setup()
				end
			}
		},
		config = function()
			vim.keymap.set("n", "<leader>g", vim.cmd.Git)
			vim.keymap.set("n", "<leader>G", function() vim.cmd("0Git") end)
		end
	}
}
