local mpd = require('mpd')


mpd.setup({
  host = 'localhost',
  port = '6600', -- is quite possible that you use another port for mpd
})

vim.keymap.set("n", "<space>s", function()
	mpd.find_song(nil)
end)
