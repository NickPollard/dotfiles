"
" Vim Keybindings
"

" Navigation {{
" Navigating Tabs
noremap <A-.> :tabn<CR>
noremap <A-,> :tabp<CR>

" Navigate windows with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" set up 10-line jumps with control
" TODO - deprecate in favour of vim-vertical
map <C-down> 10<down>
map <C-up> 10<up>

" toggle quickfix window with ,q, span full bottom screen
nnoremap <Leader>q :bo cwindow<CR>

" }}}

" Run the current line as if it were a command
nnoremap <leader>e :exe getline(line('.'))<cr>

" toggle quickfix window with ,q, span full bottom screen
nnoremap <Leader>q :bo cwindow<CR>
nnoremap <Leader>Q :ccl<CR>

" vim config {{{
" Edit and reload .vimrc
nnoremap <leader>ev :bo vsplit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
" }}}

" Tag shortcuts {{{
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" cycle-next-tag
nmap <Leader>] :tn<CR>
" cycle-prev-tag
nmap <Leader>[ :tp<CR>
" }}}

" Toggle word-wrap
nmap <Leader>w :set wrap!<CR>

" Notes
nmap <Leader><Leader>n :tabe ~/notes.md<CR>

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

" Motion {{{
" set up 10-line jumps with control
map <C-down> 10<down>
map <C-up> 10<up>
" }}}

" Recording {{{
" Remap ,,q to be recording, and unmap q
noremap <Leader><Leader>q q
noremap q <Nop>
" }}}

" Avoid accidental misclicks
vnoremap J j
vnoremap u y

<<<<<<< HEAD
=======
>>>>>>> 52ebdda ([vim] Update vim config layout)

" " Delete without copying to register
nnoremap s "_d
nnoremap S "_S
nnoremap ss "_ss
" }}}

" Language and LSP {{{
" use gd to jump to definition via LSP
" TODO move to hotkeys
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" What does hover do?
" TODO move to hotkeys
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" Enable switching between header/source on :A 
"map <A-`> :A<CR>
" }}}
