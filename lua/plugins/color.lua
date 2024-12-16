return {
	{
		"romgrk/doom-one.vim",
		config = function()
			-- if os.getenv("HOSTNAME") == "FCE795" and os.getenv("TERM") == "tmux-256color" then
			-- else
			vim.g.doom_one_terminal_colors = true
			vim.cmd("colorscheme doom-one")
		end
	}
}
