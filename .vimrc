" Colors and appearance {{{
set termguicolors
set background=dark

set encoding=utf-8
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
" disable scrollbars
set guioptions-=b
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
set scrolloff=3
" }}}

" Folding {{{
" Enable syntax based folding
set foldmethod=syntax
" Set Fold column width
set foldcolumn=2
" Open all folds by default
set foldlevel=15
" }}}

" Stop creation of back files (~)
set nobackup
" Stop Auto Comment
au FileType * setl fo-=cro

" always add the current file's directory to the path if not already there
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path+=".s:tempPath

" Leader is ','
let mapleader = ","

" Plugins {{{
" TODO - have a toggle control for whether to import usual plugins?
" source ~/.vim/plugins.vim
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

autocmd BufWritePost *.rs silent! !rustfmt <afile>

autocmd BufRead .vimrc set foldmethod=marker
