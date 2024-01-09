"
" Language specific settings
"
" use gd to jump to definition via LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" What does hover do?
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

call SourceLocal ("vim/langs.d/rust.vimrc")
call SourceLocal ("vim/langs.d/cpp.vimrc")
