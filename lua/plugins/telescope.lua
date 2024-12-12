return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			require("telescope").setup{
				defaults = {
					mappings = {
						i = {
							["<c-n>"] = "move_selection_previous";
							["<c-p>"] = "move_selection_next";
						}
					},
					pickers = {

					},
					extensions = {
						harpoon
					}
				}
			}
			local tele = require("telescope.builtin")
			vim.keymap.set("n", "<space>.", tele.find_files)
			vim.keymap.set("n","<space>g", tele.live_grep)
			vim.keymap.set("n","<space>i", tele.lsp_implementations)
			vim.keymap.set("n","<leader>h", tele.help_tags)
		end
	},
}
