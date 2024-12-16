return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{
				"williamboman/mason.nvim",
				config = function()
					require("mason").setup()
				end
			}
		},
		config = function()
			require("lspconfig").lua_ls.setup {}
			require("lspconfig").bashls.setup {}

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
					vim.keymap.set("i", "<c-o>", "<c-x><c-o>")
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					if client:supports_method('textDocument/formatting') then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end
	}
}
