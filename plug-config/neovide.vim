if exists("g:neovide")
	" let g:neovide_tranparency=0.6
	" let g:transparency=0.6
	cd $HOME
	" :Explore
	augroup ProjectDrawer
		autocmd!
		autocmd VimEnter * if argc() == 0 | Explore | endif
	augroup END
	let g:neovide_input_use_logo = 1
	map <D-v> "+p<CR>
	map! <D-v> <C-R>+
	tmap <D-v> <C-R>+
	vmap <D-c> "+y<CR> 
endif
