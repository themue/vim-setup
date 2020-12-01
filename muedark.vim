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
"
" Settings for colored terminals.
"
if &t_Co >= 256
  hi Normal           ctermbg=none ctermfg=249  cterm=none
  hi Comment          ctermbg=none ctermfg=33   cterm=none
  hi Statement        ctermbg=none ctermfg=173  cterm=none
  hi Identifier       ctermbg=none ctermfg=40   cterm=none
  hi Type             ctermbg=none ctermfg=214  cterm=none
  hi Function         ctermbg=none ctermfg=202  cterm=none
  hi PreProc          ctermbg=none ctermfg=95   cterm=none

  hi Constant         ctermbg=none ctermfg=166  cterm=none
  hi Boolean          ctermbg=none ctermfg=124  cterm=none
  hi String           ctermbg=none ctermfg=106  cterm=none

  hi LineNr           ctermbg=none ctermfg=241  cterm=none
  hi MatchParen                    ctermfg=34   cterm=none
  hi Conceal          ctermbg=none ctermfg=245  cterm=none
  hi ColorColumn      ctermbg=236  ctermfg=none cterm=none
  hi SignColumn       ctermbg=233  ctermfg=242  cterm=none
  hi Folded           ctermbg=none ctermfg=88   cterm=none
  hi FoldColumn       ctermbg=none ctermfg=88   cterm=none

  hi Directory        ctermbg=none ctermfg=143  cterm=none
  hi Special          ctermbg=none ctermfg=77   cterm=none
  hi SpecialKey       ctermbg=none ctermfg=240  cterm=none
  hi Underlined       ctermbg=none ctermfg=none cterm=underline

  hi Visual           ctermbg=16   ctermfg=250  cterm=reverse
  hi VisualNOS        ctermbg=none ctermfg=none cterm=underline
  hi IncSearch        ctermbg=106  ctermfg=235  cterm=none
  hi Search           ctermbg=106  ctermfg=235  cterm=none

  hi Title            ctermbg=none ctermfg=109  cterm=none
  hi StatusLine       ctermbg=16   ctermfg=255  cterm=bold
  hi StatusLineNC     ctermbg=16   ctermfg=233  cterm=none
  hi VertSplit        ctermbg=252  ctermfg=none cterm=none
  hi ModeMsg          ctermbg=none ctermfg=111  cterm=none
  hi WildMenu         ctermbg=236  ctermfg=111  cterm=underline

  hi DiffAdd          ctermbg=64   ctermfg=235  cterm=none
  hi DiffDelete       ctermbg=160  ctermfg=235  cterm=none
  hi DiffChange       ctermbg=60   ctermfg=235  cterm=none
  hi DiffText         ctermbg=214  ctermfg=235  cterm=none

  hi Pmenu            ctermbg=238  ctermfg=222  cterm=none
  hi PmenuSel         ctermbg=137  ctermfg=238  cterm=none
  hi PmenuSbar        ctermbg=137  ctermfg=none cterm=none
  hi PmenuThumb       ctermbg=136  ctermfg=none cterm=none

  hi SpellBad         ctermbg=none ctermfg=none cterm=undercurl
  hi SpellCap         ctermbg=none ctermfg=none cterm=undercurl
  hi SpellLocal       ctermbg=none ctermfg=none cterm=undercurl
  hi SpellRare        ctermbg=none ctermfg=none cterm=undercurl

  hi ErrorMsg         ctermbg=124  ctermfg=235  cterm=none
  hi WarningMsg       ctermbg=none ctermfg=124  cterm=none
  hi MoreMsg          ctermbg=none ctermfg=111  cterm=none
  hi Question         ctermbg=none ctermfg=111  cterm=none

  hi TabLine          ctermbg=236  ctermfg=241  cterm=none
  hi TabLineSel       ctermbg=236  ctermfg=111  cterm=none
  hi TabLineFill      ctermbg=236  ctermfg=230  cterm=none

  hi Error            ctermbg=none ctermfg=124  cterm=reverse
  hi Ignore           ctermbg=none ctermfg=none cterm=none
  hi Todo             ctermbg=none ctermfg=214  cterm=none

  hi NonText          ctermbg=none ctermfg=240  cterm=none

  hi Cursor           ctermbg=172  ctermfg=0    cterm=none
  hi CursorColumn     ctermbg=172  ctermfg=0    cterm=none
  hi CursorLine       ctermbg=235  ctermfg=none cterm=none
  hi CursorLineNr     ctermbg=235  ctermfg=220  cterm=none

  hi HelpNormal       ctermbg=none ctermfg=none cterm=none
  hi HelpLeadBlank    ctermbg=none ctermfg=none cterm=none
endif
"
" Settings for GUI
"
if has("gui_running")
  hi Normal           guibg=black         guifg=grey70          gui=none
  hi Comment          guibg=black         guifg=red2            gui=none
  hi Statement        guibg=black         guifg=lightsalmon3    gui=none
  hi Identifier       guibg=black         guifg=green3          gui=none
  hi Type             guibg=black         guifg=orange1         gui=none
  hi Function         guibg=black         guifg=orangered1      gui=none
  hi PreProc          guibg=black         guifg=lightpink4      gui=none

  hi Constant         guibg=black         guifg=darkorange3     gui=none
  hi Boolean          guibg=black         guifg=red3            gui=none
  hi String           guibg=black         guifg=yellow4         gui=none

  hi LineNr           guibg=black         guifg=grey39          gui=none
  hi MatchParen                           guifg=green3          gui=none
  hi Conceal          guibg=black         guifg=grey54          gui=none
  hi ColorColumn      guibg=grey19                              gui=none
  hi SignColumn       guibg=grey7         guifg=grey42          gui=none
  hi Folded           guibg=black         guifg=darkred         gui=none
  hi FoldColumn       guibg=black         guifg=darkred         gui=none

  hi Directory        guibg=black         guifg=darkkhaki       gui=none
  hi Special          guibg=black         guifg=palegreen3      gui=none
  hi SpecialKey       guibg=black         guifg=grey35          gui=none
  hi Underlined       guibg=black                               gui=underline

  hi Visual           guibg=grey0         guifg=grey74          gui=reverse
  hi VisualNOS        guibg=black                               gui=underline
  hi IncSearch        guibg=yellow4       guifg=grey15          gui=none
  hi Search           guibg=yellow4       guifg=grey15          gui=none

  hi Title            guibg=black         guifg=lightskyblue3   gui=none
  hi StatusLine       guibg=grey0         guifg=grey93          gui=bold
  hi StatusLineNC     guibg=grey0         guifg=grey7           gui=none
  hi VertSplit        guibg=grey82                              gui=none
  hi ModeMsg          guibg=black         guifg=skyblue2        gui=none
  hi WildMenu         guibg=grey19        guifg=skyblue2        gui=underline

  hi DiffAdd          guibg=chartreuse4   guifg=grey15          gui=none
  hi DiffDelete       guibg=red3          guifg=grey15          gui=none
  hi DiffChange       guibg=mediumpurple4 guifg=grey15          gui=none
  hi DiffText         guibg=orange1       guifg=grey15          gui=none

  hi Pmenu            guibg=grey27        guifg=lightgoldenrod2 gui=none
  hi PmenuSel         guibg=lightsalmon3  guifg=grey27          gui=none
  hi PmenuSbar        guibg=lightsalmon3                        gui=none
  hi PmenuThumb       guibg=darkgoldenrod                       gui=none

  hi SpellBad         guibg=black                               gui=undercurl
  hi SpellCap         guibg=black                               gui=undercurl
  hi SpellLocal       guibg=black                               gui=undercurl
  hi SpellRare        guibg=black                               gui=undercurl

  hi ErrorMsg         guibg=red3          guifg=grey15          gui=none
  hi WarningMsg       guibg=black         guifg=red3            gui=none
  hi MoreMsg          guibg=black         guifg=skyblue2        gui=none
  hi Question         guibg=black         guifg=skyblue2        gui=none

  hi TabLine          guibg=grey19        guifg=grey39          gui=none
  hi TabLineSel       guibg=grey19        guifg=skyblue2        gui=none
  hi TabLineFill      guibg=grey19        guifg=cornsilk1       gui=none

  hi Error            guibg=black         guifg=red3            gui=reverse
  hi Ignore           guibg=black                               gui=none
  hi Todo             guibg=black         guifg=orange1         gui=none

  hi NonText          guibg=black         guifg=grey35          gui=none

  hi Cursor           guibg=orange3       guifg=black           gui=none
  hi CursorColumn     guibg=orange3       guifg=black           gui=none
  hi CursorLine       guibg=grey19                              gui=none
  hi CursorLineNr     guibg=grey19        guifg=gold1           gui=none

  hi HelpNormal       guibg=black                               gui=none
  hi HelpLeadBlank    guibg=black                               gui=none
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
