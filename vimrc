" ==================================================
" .vimrc / init.vim
" ==================================================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'dkprice/vim-easygrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'guns/vim-clojure-static'
Plug 'othree/html5.vim'
Plug 'guns/xterm-color-table.vim'
call plug#end()
" --------------------------------------------------
" SETTINGS
" --------------------------------------------------
filetype off
filetype plugin indent off
set autoread
set autoindent
set incsearch
set noignorecase
set smartcase
set hlsearch
set number
set cursorline
set showcmd
set splitright
set splitbelow
set noswapfile
set autowrite
set showcmd
set splitright
set splitbelow
set noswapfile
set autowrite
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0
set shell=bash
set mouse=a
set ttymouse=xterm2
set ttyfast
set ttyscroll=3
set laststatus=2
set encoding=utf-8
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

set t_Co=256
colorscheme muedark
syntax on

let mapleader = "-"
let maplocalleader = "#"

let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:ale_completion_enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "sol"

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_updatetime = 500
let g:go_info_mode = 'gocode'
let g:go_list_type = "quickfix"
let g:go_list_height = 10
let g:go_test_show_name = 1
let g:go_test_timeout = '30s'

let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['cyan', 'yellow', 'lightblue', 'green', 'brown', 'darkmagenta', 'red'],
	\	'ctermfgs': ['cyan', 'yellow', 'lightblue', 'green', 'brown', 'darkmagenta', 'red'],
	\	'operators': '_,\|;\|:=\|==\|!=\|<=\|>=\|<-\|->\|=_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold']
	\}
" --------------------------------------------------
" CONDITIONAL SETTINGS
" --------------------------------------------------
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
endif
if has("gui_running")
  set guioptions=Te
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Go\ Mono\ 16
  elseif has("gui_photon")
    set guifont=Go\ Mono:h16
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Go_Mono:h16
  endif
endif
" --------------------------------------------------
" FUNCTIONS AND COMMANDS
" --------------------------------------------------
function! g:KbdGerman()
    iunmap ü
    iunmap ö
    iunmap ä
    iunmap Ö
    iunmap Ä
    iunmap ß
endfunction

function! g:KbdProgramming()
    imap ü <C-[>
    imap ö [
    imap ä ]
    imap Ö {
    imap Ä }
    imap ß /
endfunction

command! KbdGerman      :call KbdGerman()
command! KbdProgramming :call KbdProgramming()
command! Todo           noautocmd vimgrep /TODO\|FIXME/j ** | cw
command! MkTags         noautocmd !gotags -R -sort * > tags
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
" Move visual block
"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
" Searching
"
nmap <leader>s          :%s//gc<LEFT><LEFT><LEFT>
nmap <leader>sw         :%s/\<<C-r><C-w>\>//g<Left><Left>
nmap <expr> <leader>sr  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <leader>g          :vimgrep // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nmap <leader>a          :Ack *<LEFT>
nnoremap n nzzzv
nnoremap N Nzzzv
"
" Console
"
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <S-H> gT
map <S-L> gt
"
" Buffers
"
nmap <leader>hh :bprevious<cr>
nmap <leader>jj :tabnext<cr>
nmap <leader>kk :tabprevious<cr>
nmap <leader>ll :bnext<cr>
nmap <leader>xx :bdelete<cr>
"
" FZF
"
nnoremap <C-P>o :Files<cr>
nnoremap <C-P>p :Buffers<cr>
nnoremap <C-P>t :Tags<cr>
nnoremap <C-P>m :Commits<cr>
nnoremap <C-P>l :Lines<cr>
nnoremap <C-P>c :Commands<cr>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
"
" Misc
"
inoremap <leader>ww      <esc>:w<cr>
nnoremap <leader>ww      :w<cr>
nmap     <leader>cn      :cnext<cr>
nmap     <leader>cp      :cprev<cr>
nmap     <leader>cw      :cnewer<cr>
nmap     <leader>co      :colder<cr>
nmap     <leader>cc      :cclose<cr>
nmap     <leader>fn      :cnfile<cr>
nmap     <leader>fp      :cpfile<cr>
nmap     <leader>tt      :TagbarToggle<cr>
nmap     <leader>qq      :qa<cr>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>N       :setlocal number!<cr>

inoremap jj              <esc>
inoremap <esc>           <nop>

vnoremap < <gv
vnoremap > >gv
" --------------------------------------------------
" ACTIONS
" --------------------------------------------------
if has("autocmd")
	" Write and read buffer.
	autocmd BufWritePre * :%s/\s\+$//e
	autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
	" Go together with vim-go.
	autocmd FileType go nmap <localleader>b :GoBuild<cr>
	autocmd FileType go nmap <localleader>B :GoTestCompile<cr>
	autocmd FileType go nmap <localleader>c :GoCallers<cr>
	autocmd FileType go nmap <localleader>C :GoCallees<cr>
	autocmd FileType go nmap <localleader>d :GoDef<cr>
	autocmd FileType go nmap <localleader>D :GoDecls<cr>
	autocmd FileType go nmap <localleader>f :GoFmt<cr>
	autocmd FileType go nmap <localleader>F :GoImports<cr>
	autocmd FileType go nmap <localleader>i :GoImplements<cr>
	autocmd FileType go nmap <localleader>I :GoInstall<cr>
	autocmd FileType go nmap <localleader>l :GoLint<cr>
	autocmd FileType go nmap <localleader>L :GoDeclsDir<cr>
	autocmd FileType go nmap <localleader>o :GoCoverage<cr>
	autocmd FileType go nmap <localleader>p :GoDeps<cr>
	autocmd FileType go nmap <localleader>P :GoChannelPeers<cr>
	autocmd FileType go nmap <localleader>r :GoReferrers<cr>
	autocmd FileType go nmap <localleader>s :GoCallstack<cr>
	autocmd FileType go nmap <localleader>S :GoDescribe<cr>
	autocmd FileType go nmap <localleader>t :GoTestFunc<cr>
	autocmd FileType go nmap <localleader>T :GoTest<cr>
	autocmd FileType go nmap <localleader>v :GoVet<cr>
	autocmd FileType go nmap <localleader>V :GoDocVertical<cr>
	autocmd FileType go nmap <localleader>X :GoRun<cr>
endif
" Keep undo history across sessions by storing it in a file.
if has('persistent_undo')
	let vimdir = '$HOME/.vim'
	let vimundodir = expand(vimdir . '/undodir')
	call system('mkdir ' . vimdir)
	call system('mkdir ' . vimundodir)
	let &undodir = vimundodir
	set undofile
endif

call KbdProgramming()
" ==================================================
" EOF
" ==================================================
