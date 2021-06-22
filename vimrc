" ==================================================
" .vimrc / init.vim
" ==================================================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'fatih/vim-go'
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
set hidden
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
set foldnestmax=4
set foldlevel=0
set shell=zsh
set mouse=a
set ttymouse=sgr
set ttyscroll=3
set laststatus=2
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set timeoutlen=2000
set t_Co=256
set rtp+=/usr/local/opt/fzf
set signcolumn=number
set viminfo='1000,f1

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

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = "sol"

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 0
let g:go_updatetime = 500
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_list_type = "quickfix"
let g:go_list_height = 10
let g:go_test_show_name = 1
let g:go_test_timeout = '60s'
let g:go_term_enabled = 1
let g:go_term_mode = "split"
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
    set guifont=JetBrains\ Mono\ 15
  elseif has("gui_photon")
    set guifont=JetBrains\ Mono:h15
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=JetBrains_Mono:h15
  endif
endif
if has("macunix")
  let g:tagbar_ctags_bin = "/opt/homebrew/bin/ctags"
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

function! g:CheckTerminal(num)
	if bufexists(str2nr(a:num))
		exec ":buffer " . a:num
		if &buftype == 'terminal'
			exec 'bd'
		endif
	endif
endfunction

function! g:CloseTerminals()
	let result = filter(range(1, bufnr('$')), 'CheckTerminal(v:val)')
endfunction

command! KbdGerman       :call KbdGerman()
command! KbdProgramming  :call KbdProgramming()
command! CloseTerminals  :call CloseTerminals()
command! Todo            noautocmd vimgrep /TODO\|FIXME/j ** | cw
command! MkTags          noautocmd !gotags -R -sort * > tags
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
" Ctrl-P
"
nnoremap <C-P>a :TagbarToggle<CR>
nnoremap <C-P>b :Gblame<CR>
nnoremap <C-P>c :Commits<CR>
nnoremap <C-P>f :GFiles<CR>
nnoremap <C-P>h :History:<CR>
nnoremap <C-P>l :Lines<CR>
nnoremap <C-P>m :Commands<CR>
nnoremap <C-P>n :BCommits<CR>
nnoremap <C-P>o :Files<CR>
nnoremap <C-P>p :Buffers<CR>
nnoremap <C-P>q :qa<CR>
nnoremap <C-P>t :BTags<CR>
nnoremap <C-P>v :Vexplore<CR>
nnoremap <C-P>w :Windows<CR>
inoremap <C-P>x :CloseTerminals
nnoremap <C-P>z :terminal<CR>
"
" Ctrl-K
"
nnoremap <C-K>s       //gc<LEFT><LEFT><LEFT>
nnoremap <C-K>f       /\<<C-r><C-w>\>//gc<CR>
nnoremap <C-K>r       :%s///gc<LEFT><LEFT><LEFT><LEFT>
nnoremap <C-K>w       :%s/\<<C-r><C-w>\>//g<LEFT><LEFT>
nnoremap <C-K>c       :%S/\<<C-r><C-w>\>//g<LEFT><LEFT>
nnoremap <C-K>g       :Ag <C-r><C-w><CR>
nnoremap <C-K>a       :Ag<SPACE>
nnoremap <C-K>n       :cnext<CR>
nnoremap <C-K>p       :cprev<CR>
nnoremap <C-K>k       :bnext<CR>
nnoremap <C-K>j       :bprev<CR>
nnoremap <C-K>l       :tabnext<CR>
nnoremap <C-K>h       :tabprev<CR>
nnoremap <C-K><space> :nohlsearch<CR>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
"
" Misc
"
inoremap <leader>ww       <ESC>:wa<CR>
nnoremap <leader>ww       :wa<CR>
nmap     <leader>xx       :bdelete<CR>
nmap     <leader>cc       :cclose<CR>
nmap     <leader>oo       :only<CR>
nmap     <leader>tt       :terminal<CR>
nmap     <leader>qq       :qa<CR>
nnoremap <leader><space>  :nohlsearch<CR>
nnoremap <leader>N        :setlocal number!<CR>
inoremap jj               <ESC>
nnoremap n                nzzzv
nnoremap N                Nzzzv

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
 	autocmd FileType go nmap <C-G>a :GoAddTags<CR>
 	autocmd FileType go nmap <C-G>A :GoRemoveTags<CR>
 	autocmd FileType go nmap <C-G>b :GoBuild<CR>
 	autocmd FileType go nmap <C-G>B :GoTestCompile<CR>
 	autocmd FileType go nmap <C-G>c :GoCallers<CR>
 	autocmd FileType go nmap <C-G>C :GoCallees<CR>
 	autocmd FileType go nmap <C-G>d :GoDef<CR>
 	autocmd FileType go nmap <C-G>D :GoDefPop<CR>
 	autocmd FileType go nmap <C-G>e :GoErrCheck<CR>
 	autocmd FileType go nmap <C-G>f :GoFmt<CR>
 	autocmd FileType go nmap <C-G>F :GoImports<CR>
 	autocmd FileType go nmap <C-G>h :GoDoc<CR>
 	autocmd FileType go nmap <C-G>i :GoImplements<CR>
 	autocmd FileType go nmap <C-G>I :GoInstall<CR>
 	autocmd FileType go nmap <C-G>l :GoDecls<CR>
 	autocmd FileType go nmap <C-G>L :GoDeclsDir<CR>
 	autocmd FileType go nmap <C-G>m :GoMetaLinter<CR>
 	autocmd FileType go nmap <C-G>n :GoInfo<CR>
 	autocmd FileType go nmap <C-G>o :GoCoverage<CR>
 	autocmd FileType go nmap <C-G>p :GoDeps<CR>
 	autocmd FileType go nmap <C-G>P :GoChannelPeers<CR>
 	autocmd FileType go nmap <C-G>r :GoReferrers<CR>
 	autocmd FileType go nmap <C-G>R :GoRename<CR>
 	autocmd FileType go nmap <C-G>s :GoCallstack<CR>
 	autocmd FileType go nmap <C-G>S :GoDescribe<CR>
 	autocmd FileType go nmap <C-G>t :GoTestFunc<CR>
 	autocmd FileType go nmap <C-G>T :GoTest<CR>
 	autocmd FileType go nmap <C-G>v :GoVet<CR>
 	autocmd FileType go nmap <C-G>x :GoRun %<CR>
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
