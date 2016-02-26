"
" .vimrc / init.vim
"
execute pathogen#infect()
filetype off
filetype plugin indent off
set autoread
set incsearch
set ignorecase
set smartcase
set hlsearch
set number
set cursorline
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0
set guifont=Hack:h13
set shell=bash
set wildignore+=*/logs/*,*.beam
filetype plugin indent on
colorscheme antares
syntax on
let mapleader = "-"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:erlang_tags_ignore = "_build"
let g:airline_theme = "sol"
autocmd BufWritePre * :%s/\s\+$//e
"
" Key mappings.
"
vnoremap <LEADER>y  "+y
nnoremap <LEADER>Y  "+yg_
nnoremap <LEADER>y  "+y
nnoremap <LEADER>yy  "+yy
nnoremap <LEADER>p "+p
nnoremap <LEADER>P "+P
vnoremap <LEADER>p "+p
vnoremap <LEADER>P "+P

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <F2> :%s//gc<LEFT><LEFT><LEFT>
nmap <expr> <S-F2>  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <F4> :TagbarToggle<CR>
nmap <F10> :qa<CR>
nmap <F11> :cprev<CR>
nmap <S-F11> :cpfile<CR>
nmap <C-F11> :colder<CR>
nmap <F12> :cnext<CR>
nmap <S-F12> :cnfile<CR>
nmap <C-F12> :cnewer<CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <S-H> gT
map <S-L> gt

nmap <LEADER>n :bnext<CR>
nmap <LEADER>p :bprevious<CR>
nmap <LEADER>x :ccl<CR>
nmap <LEADER>ev :tabedit $MYVIMRC<CR>
nmap <LEADER>sv :source $MYVIMRC<CR>

nnoremap <LEADER>. :CtrlPBuffer<cr>
nnoremap <LEADER>: :CtrlPTag<cr>
nnoremap <LEADER>d g<C-]>
"
" EOF
"
