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

" loading vim-plug
call plug#begin('~/.nvim/plugged')
" loading plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sheerun/vim-polyglot'

" Add plugins to runtimepath
call plug#end()

" Disabling swap file
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" git-gutter
let g:gitgutter_sign_column_always = 1
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

" nerdtree + tabs
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" deoplete + ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

" theme settings
set background=dark
colorscheme gruvbox
