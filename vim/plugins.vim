"
" Vim Plugin
"

" use ',p" to reload and update plugins
map <Leader>p :source ~/.vimrc <bar> :PlugInstall<CR>

call plug#begin("~/.vim/plugged")

" NerdTree - FileTree Pane
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Goyo - Distraction free editing (see Limelight)
Plug 'junegunn/goyo.vim'
" Limelight - Paragraph highlighting (see Goyo)
Plug 'junegunn/limelight.vim'
" Ctrlp - Fuzzy file finding
Plug 'kien/ctrlp.vim'
" Syntastic - syntax checking
" TODO: Try NeoMake instead?
Plug 'vim-syntastic/syntastic'
" Airline - handy powerline info
"Plug 'vim-airline/vim-airline'
" Togglelist - allow keys to toggle location/quickfix lists
Plug 'milkypostman/vim-togglelist'
" Gutentags - Manage and rebuild ctags
Plug 'ludovicchabant/vim-gutentags'
" CurtineIncSw - easily switch between .c and .h files
Plug 'ericcurtin/CurtineIncSw.vim'

"" Deoplete (has to handle whether we're on neovim or not)
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Markdown
Plug 'gabrielelana/vim-markdown'

call plug#end()

" NerdTree
"   Use ,f to toggle NerdTree
map <Leader>f :NERDTreeToggle %<CR>
"   Close NerdTree when opening a file
let NERDTreeQuitOnOpen=1
" Cascade directories with single child dirs
let NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1

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
autocmd BufRead *.rs :setlocal tags=./tags,./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
"   Tell rust files to fx gen-cargo in the dir of the current file
autocmd BufRead *.rs :silent !sh -c 'cd %:p:h && exec fx gen-cargo .'

"" deoplete
"let g:deoplete#enable_at_startup = 1
""   tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" 

" CurtineeIncSw
map <Leader>a :call CurtineIncSw()<CR>
