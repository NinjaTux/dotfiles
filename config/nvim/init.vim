filetype plugin indent on
syntax on
set ttyfast
set backspace=2
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set laststatus=2
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
set number
set encoding=utf-8
set splitbelow
set splitright
set scrolloff=1
set incsearch
set hlsearch
set history=1000
set cursorline
set shell=sh
set number relativenumber
set nu rnu

language en_US.UTF-8

" loading vim-plug
call plug#begin('~/.config/nvim/plugged')

" loading plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Add plugins to runtimepath
call plug#end()

" Disabling swap file
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" git-gutter
set signcolumn=yes
let g:gitgutter_eager = 0
highlight Comment cterm=italic

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_ignore_files = ['*node_modules*', '*vendor*', '*build*']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']

" theme settings
set background=dark
colorscheme gruvbox

" Key bindings
" splits navigation - ctrl + key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
