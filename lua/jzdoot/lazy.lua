-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
	{"romgrk/doom-one.vim"},
	{"tpope/vim-commentary"},
	{"tpope/vim-fugitive"},
	{"ap/vim-css-color"},
	{"nvim-lua/plenary.nvim"},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{"mbbill/undotree"},
	{"andweeb/presence.nvim"},
	{"lervag/vimtex"},
	{"lambdalisue/vim-battery"},
	{"sophacles/vim-processing"},
	{"wakatime/vim-wakatime"},
	{"ThePrimeagen/vim-be-good"},
	{"kyazdani42/nvim-web-devicons"},
	{"nvim-treesitter/nvim-treesitter" , run = ":TSUpdate"},
	{"nvim-treesitter/playground"},
	-- {"ThePrimeagen/harpoon", branch = "harpoon2"},
	{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
	},
	{"neovim/nvim-lspconfig"},
	{"VonHeikemen/lsp-zero.nvim", branch = "v4.x"},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"saadparwaiz1/cmp_luasnip"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-nvim-lua"},
	{"L3MON4D3/LuaSnip"},
	{"rafamadriz/friendly-snippets"},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{"ixru/nvim-markdown"},
	{"glacambre/firenvim", build = ":call firenvim#install(0)"},
	{"paulfrische/mpd.nvim"},
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	dependencies = { 'nvim-lua/plenary.nvim'}
	-- }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
