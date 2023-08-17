"
" Language specific settings
"

"
" Rust
"
"let g:rust_conceal=1
"let g:rust_conceal_mod_path=1

" Enable Rust LSP via `rust-analyzer`
lua require('lspconfig').rust_analyzer.setup({})
" use gd to jump to definition via LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" What does hover do?
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>



"
" C/C++
"

" CScope
"set csto=1
"set cscopeverbose!
"if filereadable("cscope.out")
    "cs add cscope.out
"endif

" CScope / CTags binds
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" highlight .cmx (fuchsia component manifest) as json
au BufRead,BufNewFile *.cmx set filetype=json

" TODO can I delete some of the above?
source ~/.vim/lang.d/rust.vimrc
source ~/.vim/lang.d/cpp.vimrc
