" ===  Reset & Basic  settings  ============================================ {{{
" 
set nocompatible | " vim only
set modelines=0
set ttyfast
if has('mouse')
    set mouse=a
endif
set encoding=utf-8

set autoread | "au CursorHold * checktime | " autoreload file on external changes

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" }}}



" ===  Autoinstall VimPlug  ================================================ {{{
"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    if has("autocmd")
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" NOTE: VimPlug automatically executes:
" - filetype plugin indent on
" - syntax enable

" }}}



" ===  Autoinstall missing Plugins on startup  ============================= {{{
"
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

" }}}



" ===  Vim Plugins  ======================================================== {{{
"
call plug#begin('~/.vim/plugged')

" Make terminal cursor change based on vim modes
Plug 'wincent/terminus'

" VimAirline; must be always before Devicons
Plug 'vim-airline/vim-airline'

" Vim IndentGuides
Plug 'thaerkh/vim-indentguides'

" Set project custom indentation
Plug 'editorconfig/editorconfig-vim'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Complete with TAB
Plug 'ajh17/VimCompletesMe'

"Vim plugin for intensely nerdy commenting power
Plug 'preservim/nerdcommenter'

" NERDTree is a file system explorer for the Vim editor.
Plug 'preservim/nerdtree'

" Vim Devicons; add icons to other plugins
Plug 'ryanoasis/vim-devicons'

" repeat.vim: enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" A git wrapper
Plug 'tpope/vim-fugitive'

call plug#end()

" }}}



" ===  VIMRC Settings  ===================================================== {{{
"
" 
if has ('autocmd')

    " autoreload vimrc on save {{{
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC 
                    \ source $MYVIMRC 
                    \| redraw 
                    \| echom "Reloaded " . $MYVIMRC
    augroup END
    " }}}

    " enable folding for vimrc {{{
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
        autocmd FileType vim setlocal foldlevel=1
    augroup END
    " }}}
endif

" }}}



" ===  Colors settings  ==================================================== {{{
"

" Allow color scheme to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^Eterm'
    set t_Co=16
endif

" We set this again 
" because striped version of vi has no autocmd or plugin support
syntax enable

" }}}



" ===  Spaces and Tab settings  ============================================ {{{
"
" this settings will be overwritten by editorconfig-vim plugin
set tabstop=4
set softtabstop=4
set expandtab
set shiftround
set shiftwidth=4
set smarttab

set autoindent
set backspace=indent,eol,start

" }}}



" ===  UI Config  ========================================================== {{{
"
set number
set relativenumber
set cursorline

" We set this again 
" because striped version of vi has no autocmd or plugin support
filetype indent on

set showcmd

set laststatus=2
set showtabline=2

set ruler

set wildmenu
set wildmode=list:longest,full

set showmatch
set showmode | " show mode when running on vi

" }}}



" ===  Searching  ========================================================= {{{
"
set incsearch 
set hlsearch
set ignorecase
set smartcase

" }}}



" ===  Folding settings  =================================================== {{{
"
" 

" }}}



" ===  Plugin Settings  ==================================================== {{{
"

" Vim-Airline Settings {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" Vim IndentGuides settings {{{
let g:indentguides_ignorelist = ['txt']
let g:indentguides_spacechar = ''
let g:indentguides_tabchar = ''
" }}}

" Close Vim if NerdTree is the only window left open {{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" }}}



" ===  File settings  ===================================================== {{{
"

" go last position in file after reopen {{{
:au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif
" }}}

" reopen last state of folds {{{
augroup remember_folds_status
    autocmd!
    au BufWinLeave ?* mkview 1
    au BufWinEnter ?* silent! loadview 1
augroup END
" }}}

" }}}



" ===  Custom Key Bindings  ================================================ {{{
"

nnoremap F gg=G'' | " Shift + F to autoindent file
nnoremap <leader>tn :call NumberToggle()<cr> | " toggle relative file numbers
nnoremap <leader><space> :nohlsearch<CR> | " turn off search highlight

" }}}



" ===  Custom Functions  =================================================== {{{
"

" RelativeNumber Toggle {{{
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
" }}}


" }}}



" ===  Reset settings  ===================================================== {{{
"
" 

" }}}



" ===  Reset settings  ===================================================== {{{
"
" 

" }}}



