"
" Language specific settings
"
" use gd to jump to definition via LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" What does hover do?
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

let path = expand('<sfile>:p:h')
exec 'source' path . '/' . 'langs.d/rust.vimrc'
exec 'source' path . '/' . 'langs.d/cpp.vimrc'
exec 'source' path . '/' . 'langs.d/csharp.vimrc'
