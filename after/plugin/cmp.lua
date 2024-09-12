local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{name = 'buffer' },
	})
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	}),
-- 	matching = { disallow_symbol_nonprefix_matching = false }
-- })
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['bashls'].setup { capabilities = capabilities }
require('lspconfig')['jdtls'].setup { capabilities = capabilities }
require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
