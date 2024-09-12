local tele = require('telescope.builtin')
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key";
		["<C-k>"] = "move_selection_previous";
		["<C-n>"] = "move_selection_previous";
		["<C-j>"] = "move_selection_next";
		["<C-p>"] = "move_selection_next";
    }
  },
  pickers = {
	-- find_files = {
      -- theme = "dropdown",
    -- }
  },
  extensions = {
	-- fzf = {
	-- 	fuzzy = true,
	-- 	override_generic_sorter = true,  -- override the generic sorter
	-- 	override_file_sorter = true,     -- override the file sorter
	-- 	case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
										 -- the default case_mode is "smart_case"
    }
  }
}
require("telescope").load_extension('harpoon')
-- require('telescope').load_extension('fzf')
vim.keymap.set("n","<space>.", tele.find_files)
-- vim.keymap.set("n","<space>m", "<cmd>Telescope harpoon marks<CR>")
vim.keymap.set("n","<space>g", tele.live_grep)
vim.keymap.set("n","<space>i", tele.lsp_implementations)
vim.keymap.set("n","<leader>h", tele.help_tags)
