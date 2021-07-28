set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'jaxbot/semantic-highlight.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'haya14busa/incsearch.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'

Plug 'jam1garner/vim-code-monokai'

Plug 'caenrique/nvim-toggle-terminal'

" end color and themes

call plug#end()

set title
set encoding=utf-8
set clipboard+=unnamedplus

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax enable
filetype plugin indent on

" Highlight extra whitespaces at the end
highlight ExtraWhitespace ctermbg=red guibg=red
au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

set shiftwidth=4
set tabstop=4
set scrolloff=8
set tw=0 wm=0

au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0

" colors and themes
" set terminal colors to 256
set t_Co=256
set t_ut=
colorscheme codedark

set updatetime=200

set number relativenumber
set ruler
set expandtab smarttab
set noswapfile
set nobackup
set nowritebackup

" incsearch
set incsearch

" cscope
set cscopeverbose
set cscopequickfix=g-,s-,c-,d-,i-,t-,e-,a-
" enable using scope as tags
set cscopetag

" SPEED
set ttyfast
set lazyredraw

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" ctrlp
let g:ctrlp_extensions = ['tag']
let g:ctrlp_open_new_file = 't'

" MAPPINGS

" Terminal
nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>

" Incsearch.
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" COC (GoTo code navigation).
noremap <silent><expr> <c-space> coc#refresh()
nmap <leader>rn <Plug>(coc-rename)

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('highlight')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" END MAPPINGS

" completion
set completeopt=longest,menuone

" bash-like TAB completion
set wildmode=longest,list,full
set wildmenu

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
