"
" Vim Plugin
"

" use ',p" to reload and update plugins
map <Leader>p :source ~/.vimrc <bar> :PlugInstall<CR>

call plug#begin("~/.vim/plugged")

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
" Allow keys to toggle location/quickfix lists
Plug 'milkypostman/vim-togglelist'
" Manage and rebuilt ctags
Plug 'ludovicchabant/vim-gutentags'

" Deoplate (has to handle whether we're on neovim or not)
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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

" deoplete
let g:deoplete#enable_at_startup = 1
"   tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" 
