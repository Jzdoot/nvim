local M = {}

function M.open_float(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	if opts.perc then
		width = math.floor(vim.o.columns * opts.perc)
		height = math.floor(vim.o.lines * opts.perc)
	end

	-- Calculate the center of the screen
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a new buffer
	local buf = vim.api.nvim_create_buf(false, true) -- No file, buffer is scratch

	-- Set the window options
	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		width = width,
		height = height,
		col = col,
		row = row,
		-- nu = true,
		-- relativenumber = true,
		-- style = 'minimal',
		border = "rounded" -- Border style
	})

	-- Execute the command or function
	if opts.cmd then
		if type(opts.cmd) == 'function' then
			opts.cmd()
		elseif type(opts.cmd) == 'string' then
			vim.cmd(opts.cmd)
		else
			vim.notify('Invalid cmd type. Must be a function or string.', vim.log.levels.ERROR)
		end
	end
	vim.keymap.set("n", "<esc><esc>", vim.cmd.q, { buffer = true })
	vim.keymap.set("n", "q", vim.cmd.q, { buffer = true })

	return buf, win
end

return M
