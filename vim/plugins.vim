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
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'

call plug#end()

" NerdTree
"   Use ,f to toggle NerdTree
map <Leader>f :NERDTreeToggle<CR>
"   Close NerdTree when opening a file
let NERDTreeQuitOnOpen=1
" Cascade directories with single child dirs
let NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1

" vim-airline
let g:airline_powerline_fonts=1
