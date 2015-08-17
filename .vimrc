set nocompatible  " [required]
filetype off      " [required]

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle [required]
Plugin 'gmarik/Vundle.vim'

"============================================================
" Plugins start here
"===========================================================
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'greyblake/vim-preview'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'tpope/vim-surround'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-haml'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'wookiehangover/jshint.vim'
Plugin 'Chiel92/vim-autoformat'
"============================================================
" Plugins end here
"============================================================

" All of your Plugins must be added before the following line
call vundle#end() " [required]

syntax on
filetype plugin indent on

" Make backspace work like most other apps
set backspace=indent,eol,start

" Show line numbers
set number

" Show invisible characters
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

" Highlight search results
set hlsearch

" Solarized color scheme
syntax enable
set background=dark
:if !empty(glob("$HOME/.vim/bundle/vim-colors-solarized"))
  let g:solarized_termtrans = 1
  colorscheme solarized
endif

set showcmd
set title
set showmatch
set undofile

set ignorecase
set smartcase

set shortmess=a


" Vertical split appears to the right
set splitright

" Horizontal split appears below
set splitbelow

" Use 4 spaces for a tab
set tabstop=4 shiftwidth=4 expandtab

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Always show airline (statusline)
set laststatus=2

" Airline theme
let g:airline_theme='solarized'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Automatically populate powerline symbol
let g:airline_powerline_fonts=1

" Autoformat settings
au BufWrite * :Autoformat

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
       \ "mode": "active",
       \ "active_filetypes": [],
       \ "passive_filetypes": ["dart", "html"] }

" Enable mouse in all modes
set mouse=a

" JSHint
let g:syntastic_javascript_checkers = ['jshint']

" Use Ag for search
let g:agprg="ag --column"

" Enable file type detection
filetype on

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" Set backup, swap and undo directories
set swapfile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Auto-open NERDTree when VIM starts without an argument
function! StartUp()
  if 0 == argc()
    NERDTree  " Open NERDTree
    wincmd w  " Switch to the empty split
    wincmd q  " Close the empty split
  end
endfunction

autocmd VimEnter * call StartUp()


" ============
" Key Bindings
" ============

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>
