if &shell =~# 'fish$'
    set shell=sh
endif

set relativenumber
set termguicolors

syntax enable
filetype plugin indent on

set tabstop=4
set shiftwidth=4

set wildmenu
set hidden

function InitLspPlugins()
	call plug#begin('~/vimplugins')

	Plug 'airblade/vim-gitgutter'
	Plug 'khaveesh/vim-fish-syntax'
	Plug 'catppuccin/vim', { 'as': 'catppuccin' }
	Plug 'mattn/vim-lsp-settings'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	
	call plug#end()
endfunction

" If you want just a simple Vim config with no plugins, just comment the
" following line
call InitLspPlugins()

" By default I want no LSP, sometimes when needed, I can simply call StartLsp
" to start it
function g:StartLsp()
	function! OnLspBufferEnabled() abort
	    setlocal omnifunc=lsp#complete
	    setlocal signcolumn=yes
	    nmap <buffer> gi <plug>(lsp-definition)
	    nmap <buffer> gd <plug>(lsp-declaration)
	    nmap <buffer> gr <plug>(lsp-references)
	    nmap <buffer> gl <plug>(lsp-document-diagnostics)
	    nmap <buffer> <f2> <plug>(lsp-rename)
	    nmap <buffer> <f3> <plug>(lsp-hover)
	endfunction
	
	augroup lsp_install
	  au!
	  autocmd User lsp_buffer_enabled call OnLspBufferEnabled()
	augroup END

endfunction

" set spell

set is

set ignorecase
set smartcase
"set gp=git\ grep\ -n
set ruler

"packadd! matchit
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
let g:airline_theme = 'catppuccin_mocha'
set noshowmode
colorscheme catppuccin_mocha

" powerline symbols
"let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.colnr = ' ℅:'
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' :'
"let g:airline_symbols.maxlinenr = '☰ '
"let g:airline_symbols.dirty='⚡'
let g:airline_stl_path_style = 'short'
let g:airline_section_c_only_filename = 1
let g:airline_extensions = ['branch']
" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
" Update sign column every quarter second
set updatetime=250
