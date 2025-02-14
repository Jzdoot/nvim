local state = {
	terminal = {
		buf = -1,
		win = -1
	},
	editor = {
		buf = -1,
		win = -1,
	},
	git = {
		buf = -1,
		win = -1
	}
}

local function create_floating_window(opts)
	opts = opts or {}
	-- Get current screen size
	local screen_width = vim.o.columns
	local screen_height = vim.o.lines

	-- Default width and height to 80% of the screen size
	local width = opts.width or math.floor(screen_width * 0.8)
	local height = opts.height or math.floor(screen_height * 0.8)

	-- Center the window
	local col = math.floor((screen_width - width) / 2)
	local row = math.floor((screen_height - height) / 2)

	-- Define the border style for the floating window
	-- local border = opts.border or "single"  -- You can also use "double", "rounded", etc.

	-- Floating window config
	local win_config = {
		relative = 'editor',
		width = width,
		height = height,
		col = col,
		row = row,
		anchor = 'NW',             -- Anchor the window to the top-left corner
		style = opts.style or 'minimal', -- Make it non-intrusive
		border = "rounded",        -- Border style
	}

	-- Open the floating window
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end
local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.terminal.win) then
		state.terminal = create_floating_window({ buf = state.terminal.buf })
		if vim.bo[state.terminal.buf].buftype ~= "terminal" then
			vim.cmd.term()
		end
		vim.keymap.set("n", "q", function() vim.api.nvim_win_hide(state.terminal.win) end, { buffer = true })
		vim.keymap.set("n", "<esc><esc>", function() vim.api.nvim_win_hide(state.terminal.win) end, { buffer = true })
	else
		vim.api.nvim_win_hide(state.terminal.win)
	end
end
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal)

local toggle_editor = function()
	local function close()
		state.editor.buf = vim.api.nvim_win_get_buf(state.editor.win)
		vim.keymap.del("n", "q")
		vim.keymap.del("n", "<esc><esc>")
		vim.keymap.set("n", "q", "q")
		vim.api.nvim_win_hide(state.editor.win)
	end
	if not vim.api.nvim_win_is_valid(state.editor.win) then
		state.editor = create_floating_window({ buf = state.editor.buf, style = "" })
		vim.keymap.set("n", "q", close)
		vim.keymap.set("n", "<esc><esc>", close)
		if vim.api.nvim_buf_get_name(state.editor.buf) == "" then
			vim.cmd("Oil")
		end
	else
		close()
	end
end
vim.api.nvim_create_user_command("Floatedit", toggle_editor, {})
vim.keymap.set("n", "<space>te", toggle_editor)

local toggle_git = function()
	if not vim.api.nvim_win_is_valid(state.git.win) then
		state.git = create_floating_window({ buf = state.git.buf })
		if vim.bo[state.git.buf].ft ~= "fugitive" then
			vim.cmd("0Git")
		end
		vim.keymap.set("n", "q", function() vim.api.nvim_win_hide(state.git.win) end, { buffer = true })
		vim.keymap.set("n", "<esc><esc>", function() vim.api.nvim_win_hide(state.git.win) end, { buffer = true })
	else
		vim.api.nvim_win_hide(state.git.win)
	end
end
vim.api.nvim_create_user_command("Foatgit", toggle_git, {})
vim.keymap.set("n", "<space>tg", toggle_git)
