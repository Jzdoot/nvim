local lsp = require("lsp-zero")
local lspconfig = require 'lspconfig'
local root_pattern = lspconfig.util.root_pattern

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim','hs' }
			}
		}
	}
})

	local lsp_attach = function(client, bufnr)
		local opts = {buffer = bufnr}

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set("n", "<leader>R", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>r", require('telescope.builtin').lsp_references, opts)
		vim.keymap.set("n", "<space>d", require('telescope.builtin').diagnostics, opts)
		vim.keymap.set("n", "<space>s", require('telescope.builtin').lsp_document_symbols, opts)
	end
	lsp.extend_lspconfig({
		sign_text = true,
		lsp_attach = lsp_attach,
		capabilities = require('cmp_nvim_lsp').default_capabilities(),
	})
	lsp.setup()
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
