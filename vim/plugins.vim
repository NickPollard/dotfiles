"
" Vim Plugin
"

" use ',p" to reload and update plugins
map <Leader>p :source ~/.vimrc <bar> :PlugInstall<CR>

call plug#begin("~/.vim/.plugged")

" NerdTree - FileTree Pane
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Goyo - Distraction free editing (see Limelight)
Plug 'junegunn/goyo.vim'
" Limelight - Paragraph highlighting (see Goyo)
Plug 'junegunn/limelight.vim'
" Ctrlp - Fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'
" Syntastic - syntax checking
" [Disabled] in favour of Neo-make
"Plug 'vim-syntastic/syntastic'
" Neo-make - asynchronous Syntastic replacement
Plug 'neomake/neomake'
" Airline - handy powerline info
"Plug 'vim-airline/vim-airline'
" Togglelist - allow keys to toggle location/quickfix lists
Plug 'milkypostman/vim-togglelist'
" Gutentags - Manage and rebuild ctags
"Plug 'ludovicchabant/vim-gutentags'
" CurtineIncSw - easily switch between .c and .h files
Plug 'ericcurtin/CurtineIncSw.vim'
" Rust
Plug 'rust-lang/rust.vim'
" Rust Autocomplete/Syntax
Plug 'racer-rust/vim-racer'
" Haskell
Plug 'neovimhaskell/haskell-vim'
" Markdown
"Plug 'gabrielelana/vim-markdown'
" Highlight git changes in sidebar
Plug 'airblade/vim-gitgutter'
" Resolve conflicts
Plug 'rhysd/conflict-marker.vim'
" Highlight GN files
Plug 'c0nk/vim-gn'
" tagbar - show a window with an outline of tags in the current file
"   usage: <leader>tb to toggle the tagbar
Plug 'majutsushi/tagbar'
" CoC - LSP based code completion (e.g. rust-analyzer)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" lspsaga (and config) - lightweight language server plugin
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
" Telescope - fuzzy finder/list navigator
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Treesitter - better language parsers (e.g. for syntax highlighting)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" To install relevant language plugin:
"  :TSInstall <lang>
"  e.g.
"  :TSInstall java
Plug 'nvim-treesitter/playground'
" LSP signature - provide function signatures when editing function calls
Plug 'ray-x/lsp_signature.nvim'
" NerdCommenter - Comment plugin for easy toggling of comment lines
Plug 'preservim/nerdcommenter'

call plug#end()

" load my lua config
" TODO - where are lua configs located now?
"lua require('my_config')

" LSP
"   lsp - use rust analyzer config
lua require('lspconfig').rust_analyzer.setup({})
"   configure lspsaga
"lua require('lspsaga_config')
"   Show references on hover
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
"   Show doc on hover
nnoremap <silent>K :Lspsaga hover_doc<CR>
"   Show definition preview on hover
nnoremap <silent> gd :Lspsaga preview_definition<CR>

" Telescope
nnoremap <leader>gb :lua require('telescope.builtin').git_branches({ prompt_prefix=🔍 })<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_commits({ prompt_prefix=🔍 })<CR>


" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
    custom_captures = {
      ["cpp.scoped_type_identifier"] = "Identifier",
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
EOF

" NerdTree
"   Use ,f to toggle NerdTree
map <Leader>f :NERDTreeToggle %<CR>
"   Close NerdTree when opening a file
let NERDTreeQuitOnOpen=1
" Cascade directories with single child dirs
let NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1

" NerdCommentor
" Don't create default mappings
let g:NERDCreateDefaultMappings = 0

" vim-airline
let g:airline_powerline_fonts=1

" Gutentags
let g:gutentags_project_info = []
let g:gutentags_project_root = []
"   Tell Gutentags that BUILD.gn is the root of the project
call add(g:gutentags_project_root, 'BUILD.gn')
"   Tell Gutentags how to identify Rust projects
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
"   Tell Gutentags how to generate tags for Rust Projects
let g:gutentags_ctags_executable_rust = '~/.vim/shims/gutentags.sh'
"   Tell rust files to use the rust std lib tags as well
"autocmd BufRead *.rs :setlocal tags=./tags,./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
"   Tell rust files to fx gen-cargo in the dir of the current file
"autocmd BufRead *.rs :silent !sh -c 'cd %:p:h && exec fx gen-cargo .'

"" deoplete
"let g:deoplete#enable_at_startup = 1
""   tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" CurtineIncSw
map <Leader>a :call CurtineIncSw()<CR>

" NeoMake
"
" Triggers -
" * When writing a buffer (no delay).
call neomake#configure#automake('w')

" Ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_extensions = ['autoignore']
"   Ignore fuchsia/out/, fuchsia/third_party/
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](out|third_party)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" enable cross-session caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Use rg for ctrl-p plugin - ripgrep is fast and makes ctrlp faster
if executable('rg')
  set grepprg=rg\ --hidden\ --color=never
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'rg --files --hidden --color=never * %s'
endif

nnoremap <C-m> :CtrlPMRU<CR>

" Goyo
nmap <Leader>g :Goyo<CR>
let g:goyo_width = 100

" Tagbar
nmap <Leader>tb :TagbarToggle<CR>
let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
let g:tagbar_width = 60

" Enable lsp-signature
lua require'lsp_signature'.on_attach()

" Customize standar Fzf Files command to preview files with `cat`
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
