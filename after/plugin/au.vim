au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " no auto comment on new line
" aug java
" 	au!
" 	au FileType java set signcolumn=yes
" 	au FileType java :vim TODO %
" 	au Filetype java map <leader>r :vsp<CR> :terminal javar Main<CR>
" 	au Filetype java map <leader>R :WakaTimeDebugEnable<CR> :vsp<CR> :terminal javad Main<CR>
" 	au Filetype java map <leader>d :WakaTimeDebugEnable<CR>
" 	au Filetype java map <leader>d :WakaTimeDebugDisable<CR>
" aug end
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
	au BufEnter _*.txt let g:airline#extensions#tabline#enabled = 0
aug end
