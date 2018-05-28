" ==================================================
" .vimrc / init.vim
" ==================================================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'w0rp/ale'
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/vim-vgo'
Plug 'nsf/gocode'
Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'zah/nim.vim'
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

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Move visual block
"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
" Searching
"
nmap <leader>s          :%s//gc<LEFT><LEFT><LEFT>
nmap <leader>sw         :%s/\<<C-r><C-w>\>//g<LEFT><LEFT>
nmap <expr> <leader>sr  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <leader>g          :vimgrep // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nmap <leader>a          :Ack -i  *<LEFT><LEFT>
nmap <leader>aw         :Ack <C-r><C-w> *
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
nmap <leader>hh :bprevious<CR>
nmap <leader>jj :tabnext<CR>
nmap <leader>kk :tabprevious<CR>
nmap <leader>ll :bnext<CR>
nmap <leader>xx :bdelete<CR>
"
" FZF
"
nnoremap <C-P>o    :Files<CR>
nnoremap <C-P>p    :Buffers<CR>
nnoremap <leader>. :Buffers<CR>
nnoremap <C-P>t    :Tags<CR>
nnoremap <C-P>h    :Commits<CR>
nnoremap <C-P>l    :Lines<CR>
nnoremap <C-P>c    :Commands<CR>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
"
" Toggles
"
nnoremap <C-T>t :NERDTreeToggle<CR>
nnoremap <C-T>g :TagbarToggle<CR>
nnoremap <C-T>e :terminal<CR>
"
" Misc
"
inoremap <leader>ww      <ESC>:w<CR>
nnoremap <leader>ww      :w<CR>
nmap     <leader>cc      :cclose<CR>
nmap     <leader>nn      :cnext<CR>
nmap     <leader>pp      :cprev<CR>
nmap     <leader>cw      :cnewer<CR>
nmap     <leader>co      :colder<CR>
nmap     <leader>fn      :cnfile<CR>
nmap     <leader>fp      :cpfile<CR>
nmap     <leader>qq      :qa<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>N       :setlocal number!<CR>
inoremap jj              <ESC>

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
	autocmd FileType go nmap <localleader>b :GoBuild<CR>
	autocmd FileType go nmap <localleader>B :GoTestCompile<CR>
	autocmd FileType go nmap <localleader>c :GoCallers<CR>
	autocmd FileType go nmap <localleader>C :GoCallees<CR>
	autocmd FileType go nmap <localleader>d :GoDef<CR>
	autocmd FileType go nmap <localleader>D :GoDecls<CR>
	autocmd FileType go nmap <localleader>f :GoFmt<CR>
	autocmd FileType go nmap <localleader>F :GoImports<CR>
	autocmd FileType go nmap <localleader>i :GoImplements<CR>
	autocmd FileType go nmap <localleader>I :GoInstall<CR>
	autocmd FileType go nmap <localleader>l :GoLint<CR>
	autocmd FileType go nmap <localleader>L :GoDeclsDir<CR>
	autocmd FileType go nmap <localleader>o :GoCoverage<CR>
	autocmd FileType go nmap <localleader>p :GoDeps<CR>
	autocmd FileType go nmap <localleader>P :GoChannelPeers<CR>
	autocmd FileType go nmap <localleader>r :GoReferrers<CR>
	autocmd FileType go nmap <localleader>s :GoCallstack<CR>
	autocmd FileType go nmap <localleader>S :GoDescribe<CR>
	autocmd FileType go nmap <localleader>t :GoTestFunc<CR>
	autocmd FileType go nmap <localleader>T :GoTest<CR>
	autocmd FileType go nmap <localleader>v :GoVet<CR>
	autocmd FileType go nmap <localleader>V :GoDoc<CR>
	autocmd FileType go nmap <localleader>X :GoRun<CR>
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
