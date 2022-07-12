" TODO - setup code folding for vim files
" Colors and appearance {{{
set termguicolors
set background=dark

set guifont=PragmataPro\ Mono\ 10
colorscheme nickblue

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
" }}}

set nocompatible

" Formatting {{{
set ts=2
set shiftwidth=2
set expandtab       " expand tabs into spaces
set nu              " enable line numbers
set ic              " ignore case
set nowrap          " no word wrap
set linespace=3     " Lineheight
set list            " Show tabs and trailing spaces
set scrolloff=3     " Minimum line padding between cursor and top and bottom of screen
set cursorline      " Highlight current cursor line
" }}}
" Motion {{{
" set up 10-line jumps with control
map <C-down> 10<down>
map <C-up> 10<up>
" }}}
" Copy/paste {{{
"
" Copy/paste to system clipboard
" " Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" }}}


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

"set diffexpr=MyDiff()
"function! MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v\.(d|o)$'

" Leader is ','
let mapleader = ","

" Plugins {{{
" TODO - have a toggle control for whether to import usual plugins?
" source ~/.vim/plugins.vim
" for vim-airline
set guifont=PragmataPro:h10
set encoding=utf-8
" }}}
" Hotkeys {{{
source ~/.vim/hotkeys.vim
" }}}
" Language specific config {{{
source ~/.vim/langs.vim
" }}}
" Local-only configs {{{
source ~/.vimrc.local
" }}}


nmap <Leader>w :set wrap!<CR>

" for ctag navigation
" cycle-next-tag
nmap <Leader>] :tn<CR>
" cycle-prev-tag
nmap <Leader>[ :tp<CR>

" Enable switching between header/source on :A
"source plugin/a.vim
"map <A-`> :A<CR>
"
" Tag shortcuts {{{
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" }}}
" toggle quickfix window with ,q, span full bottom screen
nmap <Leader>q :bo cwindow<CR>

nnoremap <leader>ev :bo vsplit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
