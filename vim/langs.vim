"
" Language specific settings
"

" use gd to jump to definition via LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" What does hover do?
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

source ~/.vim/langs.d/rust.vimrc
source ~/.vim/langs.d/cpp.vimrc
