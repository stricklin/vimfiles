"Use Vim settings, rather then Vi settings (much better!).
set nocompatible

"Plug-ins
"load ftplugins and indent files
filetype plugin on
filetype indent on

"setup plug-installed plug-ins
call plug#begin('~/.vim/plugged')

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Asynchronous task dispatcher
Plug 'tpope/vim-dispatch'

" Blacked auto formatter
Plug 'psf/black'

" ALE linter
Plug 'dense-analysis/ale'

" isort import sorter
Plug 'fisadev/vim-isort'

call plug#end()

" Set colorscheme
colorscheme elflord

" set true colors
set termguicolors
" Sets how many lines of history VIM has to remember
set history=9999

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set number line
set number

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

"Make tabs sweet
set expandtab
set smarttab
set shiftwidth=3
set tabstop=3
set ai "Auto indent
set si "Smart indent
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" When you tab-complete a vim command at the bottom of the screen, make vim pop
" up a little menu to show all your completion options at once, instead of only
" the current one
set wildmenu

" Ignore case when tab completing vim commands
set wildignorecase

" Language-Specific Settings
"enable fmt automatically when saving terraform or Go files
" terraform from: https://github.com/hashivim/vim-terraform
let g:terraform_fmt_on_save=1
" Go from: https://github.com/fatih/vim-go
let g:go_fmt_autosave=1

" Python formatting
let g:ale_fixers = {'python': ['isort', 'black']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options = '--line-length=99'
autocmd BufWritePost *.py call flake8#Flake8()

" vim custom commands
cmap w!! %!sudo tee > /dev/null
