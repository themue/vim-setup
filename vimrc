"
" .vimrc / init.vim
"
execute pathogen#infect()
filetype off
filetype plugin indent off
set incsearch
set ignorecase
set smartcase
set number
set cursorline
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0
set guifont=Hack:h13
set shell=bash
filetype plugin indent on
colorscheme antares
syntax on
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:erlang_tags_ignore = "_build"
autocmd BufWritePre * :%s/\s\+$//e
set wildignore+=*/logs/*,*.beam
"
" Key mappings.
"
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <F4> :TagbarToggle<CR>
nmap <F10> :qa<CR>
nmap <F11> :cprev<CR>
nmap <S-F11> :cpfile<CR>
nmap <C-F11> :colder<CR>
nmap <F12> :cnext<CR>
nmap <S-F12> :cnfile<CR>
nmap <C-F12> :cnewer<CR>

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

nmap <leader>n :bnext<CR>
nmap <leader>p :bprevious<CR>
nmap <leader>x :ccl<CR>
nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>


nnoremap <leader>d g<C-]>
nnoremap <leader>. :CtrlPTag<cr>
"
" EOF
"
