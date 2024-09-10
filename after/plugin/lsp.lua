
local lsp = require("lsp-zero")
local lspconfig = require 'lspconfig'
local root_pattern = lspconfig.util.root_pattern

	vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = true,
	}
	)


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
	-- local cmp = require('cmp')
	-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
	-- local cmp_mappings = lsp.defaults.cmp_mappings({
	-- 	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	-- 	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	-- 	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	-- 	["<C-Space>"] = cmp.mapping.complete(),
	-- })
	local cmp = require('cmp')
	cmp.setup({
		sources = {
			{name = 'nvim_lsp'},
		},
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) end,
		},
		mapping = cmp.mapping.preset.insert({}),
	})
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
