"
" vim color scheme muedark
"
" Frank Mueller / Oldenburg / Germany
"
hi clear

if exists('syntax_on')
    syntax reset
endif

set background=dark
let g:colors_name = 'muedark'
hi Normal guibg=black guifg=white
"
" Check for 256 colors.
"
if &t_Co >= 256
  hi Normal           ctermbg=232  ctermfg=249  cterm=NONE
  hi Comment          ctermbg=0    ctermfg=160  cterm=NONE
  hi Statement        ctermbg=0    ctermfg=173  cterm=NONE
  hi Identifier       ctermbg=0    ctermfg=40   cterm=NONE
  hi Type             ctermbg=0    ctermfg=214  cterm=NONE
  hi Function         ctermbg=0    ctermfg=202  cterm=NONE
  hi PreProc          ctermbg=0    ctermfg=95   cterm=NONE

  hi Constant         ctermbg=0    ctermfg=166  cterm=NONE
  hi Boolean          ctermbg=0    ctermfg=124  cterm=NONE
  hi String           ctermbg=0    ctermfg=106  cterm=NONE

  hi LineNr           ctermbg=0    ctermfg=241  cterm=NONE
  hi MatchParen       ctermbg=0    ctermfg=34   cterm=NONE
  hi Conceal          ctermbg=0    ctermfg=245  cterm=NONE
  hi ColorColumn      ctermbg=236  ctermfg=NONE cterm=NONE
  hi SignColumn       ctermbg=233  ctermfg=242  cterm=NONE
  hi Folded           ctermbg=0    ctermfg=88   cterm=NONE
  hi FoldColumn       ctermbg=0    ctermfg=88   cterm=NONE

  hi Directory        ctermbg=0    ctermfg=143  cterm=NONE
  hi Special          ctermbg=0    ctermfg=77   cterm=NONE
  hi SpecialKey       ctermbg=0    ctermfg=240  cterm=NONE
  hi Underlined       ctermbg=0    ctermfg=NONE cterm=UNDERLINE

  hi Visual           ctermbg=16   ctermfg=250  cterm=REVERSE
  hi VisualNOS        ctermbg=0    ctermfg=NONE cterm=UNDERLINE
  hi IncSearch        ctermbg=106  ctermfg=235  cterm=NONE
  hi Search           ctermbg=106  ctermfg=235  cterm=NONE

  hi Title            ctermbg=0    ctermfg=109  cterm=NONE
  hi StatusLine       ctermbg=16   ctermfg=255  cterm=BOLD
  hi StatusLineNC     ctermbg=16   ctermfg=233  cterm=NONE
  hi VertSplit        ctermbg=252  ctermfg=NONE cterm=NONE
  hi ModeMsg          ctermbg=0    ctermfg=111  cterm=NONE
  hi WildMenu         ctermbg=236  ctermfg=111  cterm=UNDERLINE

  hi DiffAdd          ctermbg=64   ctermfg=235  cterm=NONE
  hi DiffDelete       ctermbg=160  ctermfg=235  cterm=NONE
  hi DiffChange       ctermbg=60   ctermfg=235  cterm=NONE
  hi DiffText         ctermbg=214  ctermfg=235  cterm=NONE

  hi Pmenu            ctermbg=238  ctermfg=222  cterm=NONE
  hi PmenuSel         ctermbg=137  ctermfg=238  cterm=NONE
  hi PmenuSbar        ctermbg=137  ctermfg=NONE cterm=NONE
  hi PmenuThumb       ctermbg=136  ctermfg=NONE cterm=NONE

  hi SpellBad         ctermbg=0    ctermfg=NONE cterm=UNDERCURL
  hi SpellCap         ctermbg=0    ctermfg=NONE cterm=UNDERCURL
  hi SpellLocal       ctermbg=0    ctermfg=NONE cterm=UNDERCURL
  hi SpellRare        ctermbg=0    ctermfg=NONE cterm=UNDERCURL

  hi ErrorMsg         ctermbg=124  ctermfg=235  cterm=NONE
  hi WarningMsg       ctermbg=0    ctermfg=124  cterm=NONE
  hi MoreMsg          ctermbg=0    ctermfg=111  cterm=NONE
  hi Question         ctermbg=0    ctermfg=111  cterm=NONE

  hi TabLine          ctermbg=236  ctermfg=241  cterm=NONE
  hi TabLineSel       ctermbg=236  ctermfg=111  cterm=NONE
  hi TabLineFill      ctermbg=236  ctermfg=230  cterm=NONE

  hi Error            ctermbg=0    ctermfg=124  cterm=REVERSE
  hi Ignore           ctermbg=0    ctermfg=NONE cterm=NONE
  hi Todo             ctermbg=0    ctermfg=214  cterm=NONE

  hi NonText          ctermbg=0    ctermfg=240  cterm=NONE

  hi Cursor           ctermbg=172  ctermfg=0    cterm=NONE
  hi CursorColumn     ctermbg=172  ctermfg=0    cterm=NONE
  hi CursorLine       ctermbg=235  ctermfg=NONE cterm=NONE
  hi CursorLineNr     ctermbg=235  ctermfg=220  cterm=NONE

  hi HelpNormal       ctermbg=0    ctermfg=NONE cterm=NONE
  hi HelpLeadBlank    ctermbg=0    ctermfg=NONE cterm=NONE
endif
"
" Link colors.
"
hi link Number             Constant
hi link Character          Constant

hi link Conditional        Statement
hi link Debug              Special
hi link Define             PreProc
hi link Delimiter          Special
hi link Exception          Statement
hi link Float              Number
hi link HelpCommand        Statement
hi link HelpExample        Statement
hi link Include            PreProc
hi link Keyword            Statement
hi link Label              Statement
hi link Macro              PreProc
hi link Operator           Statement
hi link PreCondit          PreProc
hi link Repeat             Statement
hi link SpecialChar        Special
hi link SpecialComment     Special
hi link StorageClass       Type
hi link Structure          Type
hi link Tag                Special
hi link Typedef            Type

hi link htmlEndTag         htmlTagName
hi link htmlLink           Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag            htmlTagName
hi link xmlTag             Statement
hi link xmlTagName         Statement
hi link xmlEndTag          Statement

hi link markdownItalic     Preproc

hi link diffBDiffer        WarningMsg
hi link diffCommon         WarningMsg
hi link diffDiffer         WarningMsg
hi link diffIdentical      WarningMsg
hi link diffIsA            WarningMsg
hi link diffNoEOL          WarningMsg
hi link diffOnly           WarningMsg
hi link diffRemoved        WarningMsg
hi link diffAdded          String
"
" EOF
"
