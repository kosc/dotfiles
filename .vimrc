set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'    " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'         " Project and file navigation
Plugin 'majutsushi/tagbar'            " Class/module browser
Plugin 'kien/ctrlp.vim'                 " Fuzzy search
Plugin 'Chiel92/vim-autoformat'         " Auto code formatting
"------------------=== Other ===---------------------- Plugin 'bling/vim-airline'           " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'    " Pending tasks list
Plugin 'rosenfeld/conque-term'        " Consoles as buffers
Plugin 'tpope/vim-surround'       " Parentheses, brackets, quotes, XML tags, and more
Plugin 'ekalinin/Dockerfile.vim'  " Syntax highlight for docker
Plugin 'tomtom/tcomment_vim'    " Fast commenting/uncommenting
Plugin 'ervandew/supertab'              " Completions by Tab key in insert mode
Plugin 'jmcomets/vim-pony'              " Ponylang for vim
Plugin 'mattn/webapi-vim'               " For gist-vim
Plugin 'mattn/gist-vim'                 " Paste to gist plugin
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'morhetz/gruvbox'                " TrueColor-powered color scheme
Plugin 'Shougo/deoplete.nvim'           " Autocomplete
" Deoplete deps:
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Shougo/neco-syntax'             " Autocomplete with syntax
Plugin 'Shougo/neco-vim'                " Autocomplete for VimL

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'    " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'    " dependencies #2
Plugin 'honza/vim-snippets'    " snippets repo

"---------------=== Languages support ===-------------
" --- SQL ---
Plugin 'vim-scripts/SQLUtilities'
" --- Haskell ---
Plugin 'eagletmt/neco-ghc'              " Haskell autocomplete for deoplete
" --- Idris ---
Plugin 'idris-hackers/idris-vim'        " Idris-mode
" --- Agda ---
Plugin 'derekelkins/agda-vim'           " Agda-mode
" --- Coq ---
Plugin 'trefis/coquille'
" --- Python ---
Plugin 'klen/python-mode'          " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'     " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'    " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
" --- Jenkinsfile ---
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'vim-scripts/groovy.vim'         " Подсветка Groovy (для Jenkinsfile)
" --- Kotlin ---
Plugin 'udalov/kotlin-vim'
" --- Java & JVM ---
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mikelue/vim-maven-plugin'
" --- PureScript ---
Plugin 'raichoo/purescript-vim'

call vundle#end()                " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
endif
set ttyfast

" Задаём leader-ы
let localleader = "\\"

" включить подсветку кода
syntax on
tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set visualbell t_vb= 
set novisualbell       

set enc=utf-8       " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch       " инкреминтируемый поиск
set hlsearch       " подсветка результатов поиска
set nu               " показывать номера строк
set scrolloff=5       " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup        " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile        " no swap files

" прячем панельки
"set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

" настройка на Tab
set smarttab
set tabstop=8

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
set laststatus=2
" let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" TaskList настройки
map <F2> :TaskList<CR>      " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR>      " CTRL+Q - закрыть текущий буффер

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит jedi-vim (вместо него будет rope из python-mode)
let g:jedi#completions_command = 0
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Python find function usages
let g:pymode_rope_use_function_bind = '<C-c>ru'

" Возможность работать мышкой в терминале
set mouse=a

" Использовать системный буфер вместо vim-овского unnamed
set clipboard=unnamedplus

" Отступы в html-файлах
autocmd BufRead *.html call HTMLIndent()
function HTMLIndent()
  set shiftwidth=4
  set tabstop=4
  set expandtab
  set autoindent
endfunction

" Отступы в Jenkinsfile
autocmd BufRead Jenkinsfile call JenkinsfileIndent()
function JenkinsfileIndent()
  set shiftwidth=4
  set tabstop=4
  set expandtab
  set autoindent
endfunction

" Отступы в yml-файлах
autocmd BufRead *.yml call YMLIndent()
function YMLIndent()
  set shiftwidth=2
  set tabstop=2
  set expandtab
  set autoindent
endfunction

" TagBar доступен по F8
nmap <F8> :TagbarToggle<CR>

" Тема оформления с поддержкой true color
colorscheme gruvbox
set background=dark

" Makes the background transparent. Leave these out if you're not using a
" transparent terminal.
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" Семантическая подсветка кода
let s:SemanticHighlight = 1
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

" Set leader
let mapleader = "`"

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Autocomplete from java to kotlin files
" call deoplete#custom#source('javacomplete2', 'filetypes', ['java', 'kotlin', 'kt'])

set pyxversion=3
