return {
	{
		"glacambre/firenvim",
		build = ":call firenvim#install(0)",
		config = function()
			vim.g.firenvim_config = {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
				globalSettings = { alt = "all" },
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
				globalSettings = {
					alt = "all",
					takeover = "once"
				},
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
				localsettings = {
					[".*"] = {
						cmdline  = "neovim",
						content  = "text",
						priority = 0,
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
						-- selector	= "textarea",
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
						takeover = "never"
					},
					["https://replit.com/"] = {
						priority = 1,
						takeover = "never"
					},
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
					["https://learn.zybooks.com/"] = {
=======
					["aleks.com"] = {
>>>>>>> Stashed changes
=======
					["aleks.com"] = {
>>>>>>> Stashed changes
=======
					["aleks.com"] = {
>>>>>>> Stashed changes
						priority = 1,
						takeover = "never"
					}
				}
			}

			-- This is an example of how to do a specific website for firenvim and yes you have to use
			vim.cmd("autocmd BufEnter github.com_*_.txt set ft=markdown")
			vim.cmd("autocmd BufEnter zybooks.com_*_.txt set ft=python")
		end
	}
}
