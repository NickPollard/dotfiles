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
let g:colors_name = "nick"

hi Comment term=bold ctermfg=Red guifg=#df8f00
hi Normal guifg=gray15 guibg=white
hi Constant term=underline ctermfg=Magenta guifg=#7F7f7F
hi Special term=bold ctermfg=Magenta guifg=green3
hi Identifier term=underline ctermfg=Blue guifg=Blue3
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=red
hi PreProc term=underline ctermfg=Magenta guifg=Purple
hi Type term=underline ctermfg=Blue gui=NONE guifg=#3030ff
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=White guibg=Gray15
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=#ffbf80
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi  StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
hi Folded guibg=white guifg=gray
hi VertSplit guifg=gray guibg=gray
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
