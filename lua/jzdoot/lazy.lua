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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
	{ "romgrk/doom-one.vim", opts = {} },
	{ "tpope/vim-commentary", opts = {} },
	{ "tpope/vim-fugitive", opts = {} },
	{ "ap/vim-css-color", opts = {} },
	{ "nvim-lua/plenary.nvim", opts = {} },
	{ "nvim-telescope/telescope.nvim", opts = {} },
	{ "mbbill/undotree" , opts = {} },
	{ "andweeb/presence.nvim" , opts = {} },
	{ "lervag/vimtex" , opts = {} },
	{ "lambdalisue/battery.vim" , opts = {} },
	{ "sophacles/vim-processing" , opts = {} },
	{ "wakatime/vim-wakatime" , opts = {} },
	{ "ThePrimeagen/vim-be-good" , opts = {} },
	{ "neovim/nvim-lspconfig" , opts = {} },
	{ "kyazdani42/nvim-web-devicons" , opts = {} },
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', opts = {} },
	{ "nvim-treesitter/playground" , opts = {} },
	{ "ThePrimeagen/harpoon" , opts = {} },
	{ "akinsho/org-bullets.nvim" , opts = {} },
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
