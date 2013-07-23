set nocompatible
set number
syntax on

set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

nmap <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>

set guifont=Source_Code_Pro:h16
colorscheme molokai
set background=dark

"******************************
"* Cscope config
"******************************
source ~/.vim/plugin/cscope_maps.vim
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

"******************************
"* Ctags config
"******************************
set tags=./tags;/

"******************************
"* Vundle config
"******************************
if version >= 500
    set nocompatible               " be iMproved
    filetype off     

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    Bundle 'kien/ctrlp.vim'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'tpope/vim-sensible'
    Bundle 'Raimondi/delimitMate'
    Bundle 'tpope/vim-surround'
    Bundle 'scrooloose/nerdtree'
    Bundle 'ervandew/supertab'
    if has("python")
        Bundle 'SirVer/ultisnips'
    endif

    "Ctrlp setting
    set runtimepath^=~/.vim/bundle/ctrlp.vim
    let g:ctrlp_root_markers = ['.ACMEROOT']

    "nerdtree setting
    let mapleader = "\\"
    nmap <leader>nt :NERDTree<cr>
endif
