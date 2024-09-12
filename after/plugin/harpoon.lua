local harpoon = require("harpoon")

harpoon:setup()

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

vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>M", function () harpoon.ui.toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<space>m", function () toggle_telescope(harpoon:list()) end)

vim.keymap.set("n", "<space>h", function () harpoon:list():select(1) end)
vim.keymap.set("n", "<space>j", function () harpoon:list():select(2) end)
vim.keymap.set("n", "<space>k", function () harpoon:list():select(3) end)
vim.keymap.set("n", "<space>l", function () harpoon:list():select(4) end)
