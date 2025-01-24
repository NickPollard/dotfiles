"
" Vim Plugin
"

" use ',,p' to reload and update plugins
map <Leader><Leader>p :source $MYVIMRC <bar> :PlugInstall<CR>

" {{{ Plugins
call plug#begin("~/.vim/.plugged")

" My azulejo colorscheme
Plug 'nickpollard/vim-azulejo'
" NerdTree - FileTree Pane
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 
" Nvim-tree - lua based FileTree
Plug 'nvim-tree/nvim-tree.lua'

" Goyo - Distraction free editing (see Limelight)
Plug 'junegunn/goyo.vim'
" Limelight - Paragraph highlighting (see Goyo)
Plug 'junegunn/limelight.vim'
" TODO - use FZF instead of CTRLP?
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Neo-make - asynchronous Syntastic replacement
Plug 'neomake/neomake'
" ALE - asynchronous linting, e.g. syntax and semantic error checks
Plug 'dense-analysis/ale'
" Togglelist - allow keys to toggle location/quickfix lists (<leader>l, <leader>q)
Plug 'milkypostman/vim-togglelist'
" Rust
Plug 'rust-lang/rust.vim'
" Haskell
Plug 'neovimhaskell/haskell-vim'

" Mason - manage LSP dependencies
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" TODO - Learn LspSaga capabilities and use them
" lspsaga (and config) - lightweight language server plugin
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
"Plug 'nvimdev/lspsaga.nvim'
" Popup - Nvim popup functionality
Plug 'nvim-lua/popup.nvim'
" Plenary - support functions for plugins
Plug 'nvim-lua/plenary.nvim'
" Telescope - fuzzy finder/list navigator
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
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

" Calculate project roots for current file
Plug 'ahmedkhalf/project.nvim'
" View git diffs for all files for a revision
Plug 'sindrets/diffview.nvim'

" TODO - new plugins
" hop, trouble, tagbar, nvim-tree, todo-comments plugins
" - vim-illuminate
" - vim-floaterm

" highlight 'todo/fixme' coments etc.
Plug 'folke/todo-comments.nvim'
" Pretty list of compiler warnings etc.
Plug 'folke/trouble.nvim'
" Highlight word under cursor elsewhere in page
Plug 'RRethy/vim-illuminate'
" Easy comment/un-comment
Plug 'numToStr/Comment.nvim'
" Easymotion-like jumping
Plug 'smoka7/hop.nvim'
" floating terminal
Plug 'voldikss/vim-floaterm'
" Highlight cursor when jumping
Plug 'danilamihailov/beacon.nvim'

" C# language server
Plug 'OmniSharp/omnisharp-vim'

" Vim script debug assistance
Plug 'tpope/vim-scriptease'

" Fidget progress window in bottom corner
" Plug 'j-hui/fidget.nvim'

" Autocomplete (for LSP, particularly)
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'
 
" Autocomplete (for Omnisharp, particularly)
Plug 'prabirshrestha/asyncomplete.vim'

call plug#end()
" }}}

" {{{ Config: ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" }}}
"initialize numToStr/Comment
lua require('Comment').setup()


" {{{ Config: Mason
lua require("mason").setup()
" }}}

" {{{ Config: Project
lua <<EOF
  require("project_nvim").setup({})
EOF
" }}}

" {{{ Config: LSP
" [Moved to langs.vim]
"   lsp - use rust analyzer config
"   lua require('lspconfig').rust_analyzer.setup({})
"   configure lspsaga
"lua require('lspsaga').setup({})
"   Show references on hover
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
"   Show doc on hover
nnoremap <silent>KK :Lspsaga hover_doc<CR>
"   Show definition preview on hover
nnoremap <silent> gd :Lspsaga preview_definition<CR>
" }}}

" {{{ Config: Telescope
lua <<EOF
  local telescope = require("telescope")
  telescope.setup({})
  telescope.load_extension("live_grep_args")
  telescope.load_extension('projects')
EOF
nnoremap <leader>gb :lua require('telescope.builtin').git_branches({ prompt_prefix=🔍 })<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_commits({ prompt_prefix=🔍 })<CR>
" }}}

" {{{ Config: Treesitter
" Do :TSInstall markdown
"    :TSInstall rust
"    etc.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "cpp", "ocaml", "haskell", "javascript", "typescript" },
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
" }}}

" {{{ Config: Nvim-tree
lua require("nvim-tree").setup()
map <Leader>f :NvimTreeToggle<CR>
" }}}

" {{{ Config: NerdTree
"   Use ,f to toggle NerdTree
" map <Leader>f :NERDTreeToggle %<CR>
"   Close NerdTree when opening a file
let NERDTreeQuitOnOpen=1
" Cascade directories with single child dirs
let NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeWinSize=45
" }}}

" {{{ Config: NerdCommentor
" Don't create default mappings
let g:NERDCreateDefaultMappings = 0
" }}}

" {{{ Config: Goyo
nmap <Leader>g :Goyo<CR>
let g:goyo_width = 100
" }}}

" {{{ Config: Limelight
let g:limelight_priority=-1
nnoremap <Leader>l :Limelight!!<CR>
" }}}

" {{{ Config: LSP
" Enable lsp-signature
lua require'lsp_signature'.on_attach()
" }}}

" {{{ Config: FZF
" Customize standard Fzf Files command to preview files with `cat`
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
\   'bg':      ['bg', 'Comment'],
\   'hl':      ['fg', 'Type'],
\   'fg+':     ['fg', 'Normal'],
\   'bg+':     ['bg', 'Search'],
\   'hl+':     ['fg', 'Search'],
\   'border':  ['bg', 'Normal'],
\   'gutter':  ['bg', 'Search'],
\   'pointer': ['fg', 'Search']}
" }}}


" {{{ Archive
" Airline - handy powerline info
"Plug 'vim-airline/vim-airline'
" Gutentags - Manage and rebuild ctags
"Plug 'ludovicchabant/vim-gutentags'
" Syntastic - syntax checking
" [Disabled] in favour of Neo-make
"Plug 'vim-syntastic/syntastic'
" CurtineIncSw - easily switch between .c and .h files
"Plug 'ericcurtin/CurtineIncSw.vim'
" Rust Autocomplete/Syntax
"Plug 'racer-rust/vim-racer'
" Markdown
"Plug 'gabrielelana/vim-markdown'
" Resolve conflicts
" Plug 'rhysd/conflict-marker.vim'
" CoC - LSP based code completion (e.g. rust-analyzer)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Highlight git changes in sidebar
" Plug 'airblade/vim-gitgutter'
" Highlight GN files
"Plug 'c0nk/vim-gn'
" tagbar - show a window with an outline of tags in the current file
"   usage: <leader>tb to toggle the tagbar
" Plug 'majutsushi/tagbar'
" {{{ Config: vim-airline
" let g:airline_powerline_fonts=1
" Airline customization
" let g:airline_gui_mode = 'gui'
" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif
" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_solarized_bg='dark'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme="murmur"
" let g:airline#extensions#tabline#formatter='unique_tail'
" }}}
" {{{ Config: Gutentags
" let g:gutentags_project_info = []
" let g:gutentags_project_root = []
"   Tell Gutentags that BUILD.gn is the root of the project
" call add(g:gutentags_project_root, 'BUILD.gn')
"   Tell Gutentags how to identify Rust projects
" call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
"   Tell Gutentags how to generate tags for Rust Projects
" let g:gutentags_ctags_executable_rust = '~/.vim/shims/gutentags.sh'
"   Tell rust files to use the rust std lib tags as well
"autocmd BufRead *.rs :setlocal tags=./tags,./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
"   Tell rust files to fx gen-cargo in the dir of the current file
"autocmd BufRead *.rs :silent !sh -c 'cd %:p:h && exec fx gen-cargo .'
" }}}
" CurtineIncSw
" map <Leader>a :call CurtineIncSw()<CR>
" Neo-make - asynchronous Syntastic replacement
" {{{ Config: NeoMake
"
" Triggers -
" * When writing a buffer (no delay).
" call neomake#configure#automake('w')
" }}}

" }}}
