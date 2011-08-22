" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nick4"

hi Comment term=bold ctermfg=Red guifg=#a7a398
hi Normal guifg=#F0F0F0 guibg=#202020
hi Constant term=underline ctermfg=Magenta guifg=#7F7f7F
hi Special term=bold ctermfg=Magenta guifg=#ff6f00
hi Identifier term=underline ctermfg=Blue guifg=#5070ff
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=#5070ff
hi PreProc term=underline ctermfg=Magenta guifg=#c0a080
hi Type term=underline ctermfg=Blue gui=NONE guifg=#5070ff
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=White guibg=#707070
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guibg=NONE guifg=#ffbf00
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
hi VertSplit guifg=#303030 guibg=#303030
hi foldColumn guibg=#303030 guifg=#707070
hi folded guifg=#C0C0C0 guibg=#F0F0F0
" line numbers
hi LineNr guibg=#202020 guifg=#c0a080
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
