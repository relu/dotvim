set nocompatible                " Use Vim defaults instead of 100% vi compatibility

" Load Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=100                 " keep 100 lines of command line history
set undolevels=1000
set title						" Change terminal window title
set clipboard=unnamed			" Share clipboard
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" set mouse=a         " Enable the use of the mouse.
set number

syntax on
filetype plugin indent on

set noerrorbells visualbell t_vb=	" Disabled bells

if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | end 
endif

" Don't use Ex mode, use Q for formatting
map Q gq

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set number

set nobackup
set noswapfile

set tabstop=4
set shiftwidth=4
set textwidth=72

set t_Co=256			" Set terminal colors to 256

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType velocity set syntax=velocity
autocmd FileType ruby,perl,tex set shiftwidth=2

let tlist_css_settings='css;s:Selectors'

" Automatically remove trailing spaces
autocmd FileType php,js,css autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Easily set current directory to current file
map ,cd :cd %:p:h<CR>:pwd<CR>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
