return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
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
				dependencies = "williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason").setup()
					require("mason-lspconfig").setup {
						ensure_installed = { "lua_ls", "bashls", "jsonls", "jdtls" },
					}
				end
			}
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			vim.lsp.config('lua_ls', {
				capabilities = capabilities
			})
			vim.lsp.config('bashls', {
				capabilities = capabilities
			})
			vim.lsp.config('jsonls', {
				capabilities = capabilities
			})
			vim.lsp.config('jdtls', {
				capabilities = capabilities
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local tele = require("telescope.builtin")
					vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition)
					vim.keymap.set("n", "grd", tele.diagnostics)
					vim.keymap.set("n", "grr", tele.lsp_references)
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
