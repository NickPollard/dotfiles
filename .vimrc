set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" Enable switching between header/source on :A
"source plugin/a.vim
map <A-`> :A<CR>

" source $VIMRUNTIME/mswin.vim
" behave mswin

" set font
""" set guifont=lucida\ console:h10
set guifont=PragmataPro\ 10
" enable line numbers
set nu
" use my colorscheme
colorscheme nickblue
" ignore case
set ic
" turn off word wrap
set nowrap
" set tags path (for definition searching)
set tags+=~/Projects/Vitae/vitae.tags
"autocmd BufEnter ~/Projects/Vitae/* :set tags+=~/Projects/Vitae/vitae.tags
" Tag shortcuts
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" set up 10-line jumps with control
map <C-down> 10<down>
map <C-up> 10<up>
map <A-right> <C-PageDown>
map <A-left> <C-PageUp>
map <C-s> <Esc>:w<CR>
nmap <C-k> 0i//<Esc>
nmap <C-l> 0xx
" set tabwidth to 4
set ts=4
set shiftwidth=4
" Enable Horizontal Scrollbar
"set guioptions+=b
" Disable toolbar
set guioptions-=T
" non-gui tabs
set guioptions-=e
" Disable left scrollbar
set guioptions-=R
set guioptions-=r
" Disable right scrollbar
set guioptions-=L
set guioptions-=l

" Enable syntax based folding
set foldmethod=syntax
" Set Fold column width
set foldcolumn=2
" Open all folds by default
set foldlevel=15

" Stop creation of back files (~)
set nobackup
" Stop Auto Comment
au FileType * setl fo-=cro

" disable scrollbars
set guioptions-=lrb

" always add the current file's directory to the path if not already there
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
		\ exec "set path-=".s:tempPath |
      \ exec "set path+=".s:tempPath

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

" Pathogen
call pathogen#infect()

" Moonscript compile
au BufWrite *.moon silent !moonc %
