return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = {"lua", "bash"},
				sync_install = false,
				auto_install = true,
				highlight = {
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25,
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = 'o',
						toggle_hl_groups = 'i',
						toggle_injected_languages = 't',
						toggle_anonymous_nodes = 'a',
						toggle_language_display = 'I',
						focus_language = 'f',
						unfocus_language = 'F',
						update = 'R',
						goto_node = '<cr>',
						show_help = '?',
					},
				},
				-- query_linter = {
					-- enable = true,
					-- use_virtual_text = true,
					-- lint_events = {"BufWrite", "CursorHold"},
					-- },
				}
			end
		},
		{
			"nvim-treesitter/playground",
			dependencies = {"nvim-treesitter/nvim-treesitter"}
		}
	}
