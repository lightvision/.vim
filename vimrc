" ===  Basic settings and resets  ========================================== {{{
"
set nocompatible
set modelines=0
set ttyfast
set mouse=a
set termguicolors
set background=dark
set t_Co=256
set number
set relativenumber
set encoding=utf-8
set textwidth=80

"}}}


" === Autoinstall VimPlug  ========================================= {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" install missing fonts

"}}}



" === Autoinstall missing Plugins on startup  ====================== {{{
"
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

        " install missing fonts on startup
        "silent! curl -sLf https://github.com/lightvision/.vim/blob/master/install_fonts.sh | bash -s -- -h

"}}}


" ===  Vim Plugins  ======================================================== {{{
"
call plug#begin('~/.vim/plugged')
" Make terminal cursor change based on vim modes
Plug 'wincent/terminus'
call plug#end()
"}}}


" ===  Indentation Options  ================================================ {{{

" this settings will be overwritten by EditorConfig Plugin
syntax on
set autoindent
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set softtabstop=4

set expandtab
filetype indent on

"}}}
