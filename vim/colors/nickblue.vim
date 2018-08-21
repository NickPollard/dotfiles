" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Nick Pollard
" Last Change:	2016

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nickblue"

hi Comment term=italic guifg=#90907f gui=italic
hi Normal guifg=#e6e8e9 guibg=#102030
hi Constant term=underline ctermfg=Magenta guifg=#7F7f7F
hi Special term=bold ctermfg=Magenta guifg=#667788 gui=bold
hi Identifier term=bold ctermfg=Blue guifg=#ffffff gui=bold
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=#ff3030 gui=bold
hi Keyword term=bold ctermfg=DarkRed gui=NONE guifg=#ff3030 gui=bold
hi hsNiceOperator term=bold ctermfg=DarkRed gui=NONE guifg=#ff3030 gui=bold
hi conceal term=bold ctermfg=DarkRed gui=NONE guibg=#102030 guifg=#ff3030 gui=bold
hi PreProc term=underline ctermfg=Magenta guifg=#376b9d gui=bold
hi Type term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi Typedef term=underline ctermfg=Blue guifg=#40bf00 gui=bold
hi StorageClass term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi Structure term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=White guibg=Gray15
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=italic,bold guibg=#003028 guifg=#00DE96
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=#102030 guifg=#ff3030 gui=bold
hi SignColumn term=reverse ctermfg=15 ctermbg=9 guibg=#102030 guifg=#ff3030 gui=bold
hi Todo term=standout ctermbg=Yellow ctermfg=Black gui=bold,italic guifg=#f09000 guibg=NONE
hi StatusLine term=bold cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=BOLD guifg=#4eafcf guibg=black
hi TabLine guibg=#051525 gui=italic guifg=#20406f
hi TabLineFill gui=NONE guibg=#051525 guifg=#051525
hi TabLineSel guibg=NONE
hi StatusLineNC guibg=#4eafcf guifg=black
hi Folded guibg=#102030 guifg=#203040
hi FoldColumn guibg=NONE guifg=black
hi VertSplit guifg=black guibg=black
hi CursorLine guibg=black guifg=#f09000
hi MatchParen guibg=#314354
" NerdTree
hi Directory guifg=#4eafcf ctermfg=blue gui=bold
hi NERDTreeOpenable guifg=#ff3030 ctermfg=red
hi NERDTreeClosable guifg=#ff3030 ctermfg=red
" Markdown
hi htmlH1 term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi htmlH2 term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi htmlH3 term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi htmlH4 term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi htmlH5 term=underline ctermfg=Blue guifg=#4eafcf gui=bold
hi htmlH6 term=underline ctermfg=Blue guifg=#4eafcf gui=bold
" Links
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
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
