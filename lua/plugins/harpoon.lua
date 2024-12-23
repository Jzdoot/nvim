return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		enable = true,
		config = function()
			local poon = require("harpoon")

			poon:setup()

			-- Base Keymaps
			vim.keymap.set("n", "<leader>m", function() poon:list():add() end)
			vim.keymap.set("n", "<leader>M", function() poon.ui:toggle_quick_menu(poon:list()) end)

			-- Basic Selection
			vim.keymap.set("n", "<space>h", function() poon:list():select(1) end)
			vim.keymap.set("n", "<space>j", function() poon:list():select(2) end)
			vim.keymap.set("n", "<space>k", function() poon:list():select(3) end)
			vim.keymap.set("n", "<space>l", function() poon:list():select(4) end)
			vim.keymap.set("n", "<space>H",
				function()
					require("jzdoot.custom.floating_api").open_float({
						cmd = function()
							require("harpoon"):list()
								:select(1)
							print("Name : " .. vim.inspect(vim.api.nvim_buf_get_name(0)))
						end,
						perc = 0.6
					})
				end)
			vim.keymap.set("n", "<space>J",
				function()
					require("jzdoot.custom.floating_api").open_float({
						cmd = function()
							require("harpoon"):list()
								:select(2)
							print("Name : " .. vim.inspect(vim.api.nvim_buf_get_name(0)))
						end,
						perc = 0.6
					})
				end)
			vim.keymap.set("n", "<space>K",
				function()
					require("jzdoot.custom.floating_api").open_float({
						cmd = function()
							require("harpoon"):list()
								:select(3)
							print("Name : " .. vim.inspect(vim.api.nvim_buf_get_name(0)))
						end,
						perc = 0.6
					})
				end)
			vim.keymap.set("n", "<space>L",
				function()
					require("jzdoot.custom.floating_api").open_float({
						cmd = function()
							require("harpoon"):list()
								:select(4)
							print("Name : " .. vim.inspect(vim.api.nvim_buf_get_name(0)))
						end,
						perc = 0.6
					})
				end)

			-- Telescope (Copied from Harpoon2 README.md)
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers").new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				}):find()
			end

			-- Telescope Keymap
			vim.keymap.set("n", "<space>m", function() toggle_telescope(poon:list()) end)
		end
	},
}
