vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
  -- use 'NTBBloodbath/doom-one.nvim'
	use 'romgrk/doom-one.vim'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'ap/vim-css-color'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
	use 'mbbill/undotree'
	use 'andweeb/presence.nvim'
	use 'lervag/vimtex'
	use 'lambdalisue/battery.vim'
	use 'sophacles/vim-processing'
	use 'wakatime/vim-wakatime'
	use 'ThePrimeagen/vim-be-good'
	use 'neovim/nvim-lspconfig'
	-- use 'mfussenegger/nvim-jdtls'
	use 'kyazdani42/nvim-web-devicons'
	use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'}
	use 'nvim-treesitter/playground'
	use 'ThePrimeagen/harpoon'
	-- Org Mode
	-- use {'nvim-orgmode/orgmode', config = function()
	-- 	require('orgmode').setup{}
	-- end
	-- }
	-- use {
	-- 	'lukas-reineke/headlines.nvim',
	-- 	config = function()
	-- 		require('headlines').setup()
	-- 	end,
	-- }
	-- use 'akinsho/org-bullets.nvim'
	-- FOR WHEN YOU STOP USING JAVA!!
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	use 'github/copilot.vim'
	use 'nvim-lualine/lualine.nvim'
	use({
		"jackMort/pommodoro-clock.nvim",
		config = function()
			require("pommodoro-clock").setup({
				-- optional configuration
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
		}
	})
	use 'vimwiki/vimwiki'
end)
