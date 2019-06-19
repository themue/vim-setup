" ==================================================
" .vimrc / init.vim
" ==================================================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'dkprice/vim-easygrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'myitcv/govim'
" Plug 'fatih/vim-go'
Plug 'guns/xterm-color-table.vim'
call plug#end()
" --------------------------------------------------
" SETTINGS
" --------------------------------------------------
filetype off
filetype plugin indent off

set autoread
set autowrite
set autoindent

set cursorline
set hlsearch
set incsearch
set number
set showcmd
set smartcase
set splitright
set splitbelow
set splitright
set splitbelow
set ttyfast

set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set foldmethod=syntax
set foldnestmax=10
set foldlevel=0
set shell=bash
set mouse=a
set ttymouse=sgr
set ttyscroll=3
set laststatus=2
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set timeoutlen=2000
set t_Co=256

set noexpandtab
set nobackup
set nocompatible
set nofoldenable
set noignorecase
set noswapfile
set nowritebackup

filetype plugin indent on
colorscheme muedark
syntax on

let mapleader = "+"
let maplocalleader = "#"

let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore /vendor/'

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

let g:ale_completion_enabled = 1
let g:ale_linters = {'go': ['golint']}

let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = "sol"

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_updatetime = 500
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_list_type = "quickfix"
let g:go_list_height = 10
let g:go_test_show_name = 1
let g:go_test_timeout = '30s'
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
    set guifont=IBM\ Plex\ Mono\ 15
  elseif has("gui_photon")
    set guifont=IBM\ Plex\ Mono:h15
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=IBM_Plex_Mono:h15
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
nmap <leader>s          //gc<LEFT><LEFT><LEFT>
nmap <leader>sw         /\<<C-r><C-w>\>//gc<CR>
nmap <leader>r          :%s//gc<LEFT><LEFT><LEFT>
nmap <leader>rw         :%s/\<<C-r><C-w>\>//g<LEFT><LEFT>
nmap <expr> <leader>rr  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <leader>g          :vimgrep // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nmap <leader>as         :Ag<SPACE>
nmap <leader>aw         :Ag <C-r><C-w><CR>

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
" Ctrl-P
"
nnoremap <C-P>a :Ag <C-R><C-W><CR>
nnoremap <C-P>b :BTags<CR>
nnoremap <C-P>c :cclose<CR>
nnoremap <C-P>d :bdelete<CR>
nnoremap <C-P>g :GFiles<CR>
nnoremap <C-P>h :History:<CR>
nnoremap <C-P>i :Commits<CR>
nnoremap <C-P>l :Lines<CR>
nnoremap <C-P>m :Commands<CR>
nnoremap <C-P>n :BCommits<CR>
nnoremap <C-P>o :Files<CR>
nnoremap <C-P>p :Buffers<CR>
nnoremap <C-P>q :qa<CR>
nnoremap <C-P>r :TagbarToggle<CR>
nnoremap <C-P>t :Tags<CR>
nnoremap <C-P>w :w<CR>
inoremap <C-P>w <ESC>:w<CR>
inoremap <C-P>x <ESC>
nnoremap <C-P>z :terminal<CR>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
"
" Misc
"
inoremap <leader>ww      <ESC>:w<CR>
nnoremap <leader>ww      :w<CR>
nmap     <leader>hh      :bprevious<CR>
nmap     <leader>jj      :tabnext<CR>
nmap     <leader>kk      :tabprevious<CR>
nmap     <leader>ll      :bnext<CR>
nmap     <leader>xx      :bdelete<CR>
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
	" Go / vim-go.
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
	autocmd FileType go nmap <localleader>n :GoInfo<CR>
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
" Standard keyboard for programming.
call KbdProgramming()
" ==================================================
" EOF
" ==================================================
