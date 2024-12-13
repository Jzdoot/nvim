return {
	{
		"paulfrische/mpd.nvim",
		config = function()
			local mpd = require("mpd")

			mpd.setup({
				host = "localhost",
				port="6600"
			})
			vim.keymap.set("n", "<space>s", function() mpd.find_song(nil) end)
		end
	}
}
