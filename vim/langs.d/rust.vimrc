"
" Rust
"

" Run Rustfmt on save of '.rs' files
autocmd BufWritePost *.rs silent! !rustfmt <afile>

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
