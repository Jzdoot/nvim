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
