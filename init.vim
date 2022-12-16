lua << EOF
--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
Neovim init file
Maintainer: JZDoot
Website: https://gitlab.com/jzdoot/dotfiles/-/blob/master/.config/nvim/init.vim
--]]
EOF
syntax on set noerrorbells
" set foldenable
" set foldmethod=indent
set tabstop=4 softtabstop=4
set shiftwidth=4
set number relativenumber
set smartindent
set incsearch
set splitbelow splitright " Splits open from opisite sides
set signcolumn=number

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'mboughaba/i3config.vim'
Plug 'romgrk/doom-one.vim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'Python-mode/python-mode'
Plug 'blankname/vim-fish'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'paretje/nvim-man'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/todo-comments.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'andweeb/presence.nvim'
Plug 'lervag/vimtex'
Plug 'lambdalisue/battery.vim'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'seandewar/nvimesweeper'
Plug 'sophacles/vim-processing'
Plug 'wakatime/vim-wakatime'
Plug 'ellisonleao/glow.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/harpoon'
Plug 'dbeniamine/cheat.sh-vim'

call plug#end()
"firenvim
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'takeover': 'never',
        \ },
		\'https://replit.com/': {
			\'priority': 1,
			\'takeover': 'never',
		\}
    \ }
\ }
" Netrw
" let g:netrw_liststyle=3
colorscheme doom-one
" Airline stuff
let g:airline_theme='minimalist'
set termguicolors
let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#tabline#enabled = 0
" FZF Stuff 
let g:fzf_layout = { 'down': '35%'} "setting fzf to open in a new buffer below
" Vimtex
let g:vimtex_view_method = 'skim'
" let g:vimtex_compiler_method = 'texlive'
" autocmd Stuff
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " no auto comment on new line
aug All
	au!
	" au BufEnter * lua package.loaded.presence:update()
	au FileType * lua package.loaded.presence:update()
aug end
aug java
	au!
	au FileType java set signcolumn=yes
	" au FileType java :vim TODO %
	au Filetype java map <leader>r :vsp<CR> :terminal javar Main<CR>
	au Filetype java map <leader>R :WakaTimeDebugEnable<CR> :vsp<CR> :terminal javad Main<CR>
	au Filetype java map <leader>d :WakaTimeDebugEnable<CR>
	au Filetype java map <leader>d :WakaTimeDebugDisable<CR>
aug end
aug processing
	au Filetype processing set signcolumn=yes
	au Filetype processing map <leader>r :make<CR>
aug end
aug cpp
    au!
    au FileType cpp set signcolumn=yes
    au Filetype cpp set makeprg=gcc\ % "sets the :make to gcc
    au FileType cpp map <leader>r :term ./a.out<CR>
    au FileType cpp map <leader>Rm :make<CR> :term ./a.out;rm -rf *.out<CR>
aug end
aug lua
	au!
	au FileType lua set signcolumn=yes
	au Filetype lua set makeprg=luac5.2\ % "sets the :make to lua compiler
	" au Filetype lua map <leader>r :vsp<CR> :terminal lua %<CR>
	au FileType lua map <leader>r :vsp<CR> :terminal lua %<CR>
aug end
aug bash
	au!
	au FileType sh set signcolumn=yes
aug vim
	au!
	au Filetype vim set signcolumn=yes
	au BufWritePost *.vim so ~/.config/nvim/init.vim
aug end
aug i3config_ft_detection "i3 config
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
aug speek
	au!
	au BufNewFile,BufRead ~/speek.txt set filetype=say
aug end
aug firenvim
	au!
	au BufEnter github.com_*.txt set filetype=markdown
	au BufEnter replit.com_*.txt set filetype=java
aug end
let g:javascript_plugin_flow = 1
filetype plugin indent on
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
" Keybinds
map <space>. :Telescope find_files<CR>
map <space>m :Telescope harpoon marks<CR>
map <space>g :Telescope live_grep<CR>
"buffer switching
" map <space>1 :buffer 1<CR>
" map <space>2 :buffer 2<CR>
" map <space>3 :buffer 3<CR>
" map <space>4 :buffer 4<CR>
" map <space>5 :buffer 5<CR>
" map <space>6 :buffer 6<CR>
" map <space>7 :buffer 7<CR>
" map <space>8 :buffer 8<CR>
" map <space>9 :buffer 9<CR>
" map <space>0 :buffer 10<CR>
let mapleader =";"
map <leader>. :Telescope find_files<CR>
map <leader>t :term<CR>
map <leader>T :vsp<CR> :term<CR>
map <leader>l :tabnext<CR>
map <leader>h :tabprevious<CR>
map <leader>n :tabnew<CR>
map <leader>N :tabclose<CR>
map <leader>c :!code %:p:h<CR>
" map <leader>c :!code %<CR>
map <leader>C :cd %:p:h<CR>
" map <leader><F10>e :sp<CR> :e ~/.config/nvim/init.vim<CR>
map <leader>e :e ~/.config/nvim/init.vim<CR>
map <leader><F10>u :PlugUpdate<CR> :CocUpdate<CR> :TSUpdate<CR>
" map <leader>u :PlugUpdate<CR> :CocUpdate<CR> :TSUpdate<CR>
map <leader><F10>s :source ~/.config/nvim/init.vim<CR>
map <leader>` :Ex<CR>
map <leader>~ :vsp<CR> :Ex<CR>
map <leader>z :UndotreeToggle<CR>
map <leader>ga :G add
map <leader>gaa :G add -A<CR>
map <leader>gc :G commit<CR>
map <leader>gp :G push
map <leader>gpa :G push all<CR> :G push<CR>
map <leader>gs :G<CR>
map <leader>u :lua package.loaded.presence:update()<CR>
map <leader>j <plug>(coc-definition)
map <leader>J <plug>(coc-declaration)
map<C-d> <C-d>zz
map <C-c> <C-c>zz
map <leader>m :lua require("harpoon.mark").add_file()<CR>
map <leader>M :lua require("harpoon.ui").toggle_quick_menu()<CR>
"Aliases
command! -nargs=* W w
command! -nargs=* Wq wq
command! -nargs=* Wqa wqa
command! -nargs=* Q q
command! -nargs=* Qa qa
"Sources
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/neovide.vim
lua require("jzdoot") --Lua Configuration
