set nocompatible

"Copied a big chunk from the example vimrc to start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


"end example vimrc contents
"begin custom directives

"Set up Vundle add-on manager
filetype off							"Vundle requirement

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
 " required! 
  Plugin 'VundleVim/Vundle.vim'

 " My Bundles here:
 "
 " original repos on github
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'Lokaltog/vim-easymotion'
    "Snipmate Dependencies
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'snipmate-snippets'

  Plugin 'garbas/vim-snipmate'

  Plugin 'scrooloose/nerdcommenter'

  Plugin 'scrooloose/nerdtree'


 " vim-scripts repos
 " non github repos
 " ...


call vundle#end()

 filetype plugin indent on     " required!
 "
 " Brief help
 "
 " Be Sure to run ':BundleInstall' after a fresh vundle install.
 " That will pull all these cool bundles we just defined into vim.
 "
 "  Also- 
 "
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..


set number
colorscheme desert
syntax on

"Don't want to have to take my fingers off the home row
"Use ENTER intstead of escape, SHIFT-ENTER for linebreaks in insert mode
inoremap <CR> <Esc>

"Dont want to have to reach up to \
"Since I use EasyMotion and won't need reverse t/f, "," is a good choice
let mapleader = ","

"Again, "," is a good choice for a no-reach leader
let g:EasyMotion_leader_key = '<Leader>'

"easier autocomplete
imap <Leader><tab> <c-x><c-o>

"using source control, so don't need auto backups
set nobackup

"better tabs and indentation
set expandtab
set tabstop=2
set shiftwidth=2

"enable the matchit plugin that ships with vim
source $VIMRUNTIME/macros/matchit.vim
