return {
	{
		"glacambre/firenvim",
		build = ":call firenvim#install(0)",
		config = function ()
			vim.g.firenvim_config = {
				globalSettings = { alt = "all"},
				localsettings = {
					[".*"] = {
						cmdline		= "neovim",
						content		= "text",
						priority	= 0,
						-- selector	= "textarea",
						takeover	= "never"
					},
					["https://replit.com/"] = {
						priority	= 1,
						takeover	= "never"
					}
				}
			}

			-- This is an example of how to do a specific website for firenvim and yes you have to use 
			vim.cmd("autocmd BufEnter github.com_*_.txt set ft=markdown")
		end
	}
}
