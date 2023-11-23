"
" Rust
"
"let g:rust_conceal=1
"let g:rust_conceal_mod_path=1

" Enable Rust LSP via `rust-analyzer`

lua << EOF
require('lspconfig').rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            rust = {
              analyzerTargetDir = true
            },
        }
    }
  })
EOF
