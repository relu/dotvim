" Load Pathogen
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=100                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" set mouse=a         " Enable the use of the mouse.

set number

filetype plugin indent on
syntax on

if has("autocmd")
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | end 
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

set tabstop=4
set shiftwidth=4

set textwidth=72

" Automatically remove trailing spaces
autocmd FileType php,js,css autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Easily set current directory to current file
map ,cd :cd %:p:h<CR>:pwd<CR>

let g:netrw_preview = 1
