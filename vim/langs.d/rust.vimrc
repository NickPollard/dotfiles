"
" Rust
"
"let g:rust_conceal=1
"let g:rust_conceal_mod_path=1

" Enable Rust LSP via `rust-analyzer`
lua require('lspconfig').rust_analyzer.setup({})
