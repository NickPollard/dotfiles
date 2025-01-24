"
" C#
"

"  Show type info on hover, automatically
autocmd CursorHold *.cs OmniSharpTypeLookup
" map 'gd' to omnisharp goto definition
autocmd FileType cs nmap <buffer> gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <buffer> <leader><leader>t <Plug>(omnisharp_type_lookup)


