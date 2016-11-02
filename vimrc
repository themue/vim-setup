" ==================================================
" .vimrc / init.vim
" ==================================================
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'dkprice/vim-easygrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch'
Plug 'themue/vim-gode'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'vimoutliner/vimoutliner'
call plug#end()
" --------------------------------------------------
" SETTINGS
" --------------------------------------------------
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
set mouse=a
set ttymouse=xterm2
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

set t_Co=256
colorscheme muedark
syntax on

let mapleader = "-"
let maplocalleader = "="
let g:SuperTabDefaultCompletionType = "<C-X><C-N>"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "bubblegum"
autocmd BufWritePre * :%s/\s\+$//e

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
endif
" --------------------------------------------------
" KEY MAPPINGS
" --------------------------------------------------
"
" Yank and paste
"
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p  "+p
nnoremap <leader>P  "+P
vnoremap <leader>p  "+p
vnoremap <leader>P  "+P

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
"
" Searching
"
nmap <leader>s :%s//gc<LEFT><LEFT><LEFT>
nmap <expr> <leader>sr  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <leader>g :vimgrep // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap n nzzzv
nnoremap N Nzzzv
"
" Console
"
nmap <F11>      :cprev<cr>
nmap <S-F11>    :cpfile<cr>
nmap <C-F11>    :colder<cr>
nmap <F12>      :cnext<cr>
nmap <S-F12>    :cnfile<cr>
nmap <C-F12>    :cnewer<cr>
nmap <leader>cc :cclose<cr>
nmap <leader>tt :TagbarToggle<cr>
nmap <leader>qq :qa<cr>

imap ü <C-]>
imap ö [
imap ä ]
imap Ö {
imap Ä }
imap ß /

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <S-H> gT
map <S-L> gt
"
" Buffers
"
nmap <leader>j :bnext<cr>
nmap <leader>k :bprevious<cr>
"
" CtrlP
"
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>: :CtrlPTag<cr>
nnoremap <leader># :CtrlPBufTag<cr>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
"
" Misc
"
nnoremap <leader>N :setlocal number!<cr>
inoremap jj <esc>
inoremap yy <esc>:w<cr>
nnoremap yy :w<cr>
" --------------------------------------------------
" ACTIONS
" --------------------------------------------------
if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif
" ==================================================
" EOF
" ==================================================
