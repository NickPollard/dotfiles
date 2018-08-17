" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nickblue"

hi Comment term=italic ctermfg=Red guifg=#90907f gui=italic
hi Normal guifg=#f0f0f0 guibg=#102030
hi Constant term=underline ctermfg=Magenta guifg=#7F7f7F
hi Special term=bold ctermfg=Magenta guifg=green3 gui=bold
hi Identifier term=bold ctermfg=Blue guifg=#4070ff gui=bold
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=#ff3030 gui=bold
hi PreProc term=underline ctermfg=Magenta guifg=#4070ff gui=bold
hi Type term=underline ctermfg=Blue guifg=#40bfef gui=bold
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=White guibg=Gray15
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=italic guibg=NONE guifg=#6f00ff
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black gui=bold,italic guifg=#f09000 guibg=NONE
hi StatusLine term=bold cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=BOLD guifg=#40bfef guibg=black
hi TabLine guibg=#051525 gui=italic guifg=#20406f
hi TabLineFill gui=NONE guibg=#051525 guifg=#051525
hi TabLineSel guibg=NONE
hi StatusLineNC guibg=#40bfef guifg=black
hi Folded guibg=black guifg=black
hi FoldColumn guibg=NONE guifg=black
hi VertSplit guifg=black guibg=black
hi CursorLine guibg=black guifg=#f09000
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Special
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
