"
" Vim Hotkeys
"

" Navigating Tabs
noremap <A-.> :tabn<CR>
noremap <A-,> :tabp<CR>

" Delete without copying to register
nnoremap s "_d
nnoremap S "_S
nnoremap ss "_ss

" Navigate windows with Ctrl + hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Run the current line as if it were a command
nnoremap <leader>e :exe getline(line('.'))<cr>
