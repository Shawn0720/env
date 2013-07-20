set nocompatible
set number
syntax on

set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

"
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


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

    "Ctrlp setting
    set runtimepath^=~/.vim/bundle/ctrlp.vim
    let g:ctrlp_root_markers = ['.ACMEROOT']

    "nerdtree setting
    let mapleader = "\\"
    nmap <leader>nt :NERDTree<cr>
endif
