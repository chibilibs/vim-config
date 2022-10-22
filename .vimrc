vim9script

# Install Plug {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * :PlugInstall --sync | so $MYVIMRC
endif
# }}}1

# Vim Settings {{{1
# Disable Vi Compatibility {{{2
set nocompatible
set noloadplugins # No load default plugins
# }}}2
# File {{{2
set fileencoding=utf-8
set fileformat=unix
# }}}2
# Search {{{2
set incsearch
set ignorecase
set smartcase
set hlsearch
# }}}2
# Command-line Completion {{{2
set wildmenu
set wildoptions=fuzzy
# }}}2
# Edit {{{2
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set backspace=indent,eol,start
set autoindent
# }}}2
# Features {{{2
# Folding {{{3
if has('folding')
  set foldenable
  set foldmethod=marker
endif
# }}}3
# File type detection, indent and plugins {{{3
if has('filetype')
  filetype indent plugin on
endif
#}}}3
# Syntax highlighting {{{3
if has('syntax')
  syntax on
endif
# }}}3
# }}}2
# Others {{{2
# Set Leader Key {{{
g:mapleader = " "
# }}}
# Use The Silver Searcher instead vimgrep {{{3
if executable('ag')
  set grepprg=ag\ --vimgrep
endif
# }}}3

set noto ttimeout ttm=200
set hidden
set scrolloff=8
set lazyredraw
set noswapfile
set confirm
set nomodeline
set nostartofline

set clipboard+=unnamedplus

# }}}2
# }}}1

# Visual Settings {{{1
# Command Line {{{2
set cmdheight=1
set showcmd
# }}}2
# Status line {{{2
set laststatus=2
set ruler
# }}}2
# Theme / Colors {{{2
set background=dark
set tgc
colo slate

# Tricks {{{3
&t_8f = "\e[38;2;%lu;%lu;%lum"
&t_8b = "\e[48;2;%lu;%lu;%lum"
set vb t_vb= # Disable visual bell
# }}}3
# }}}2
# Editor {{{2
set number
set list
set listchars+=tab:→\ ,eol:\ ,space:‧,nbsp:+
# }}}2
# Split {{{2
set splitright
set splitbelow
# }}}2
# }}}1

# Plugin Settings {{{1
# ALE {{{2
g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
# }}}2
# JAVAAAAAAAA {{{2
g:vim_lsp_java = {
      \ 'eclipse_jdtls': {
        \ 'repository': expand('~/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'),
    \ 'config': 'config_linux',
    \ 'workspace': expand('$WORKSPACE'),
  \ },
  \ }
# }}}2
# }}}1

# Keybinds {{{1
nmap     <silent> <c-l>         :noh<cr>
nnoremap <silent> <leader>vr    :so $MYVIMRC<cr>
nnoremap <silent> <leader><tab> :tabnew<cr>

tnoremap <esc>         <c-w>N
# }}}1

# Plugins {{{1
call plug#begin('~/.vim/plugged')
  Plug 'dense-analysis/ale'
call plug#end()
# }}}1

# ALE Pos-load config {{{1
g:ale_fixers = { 'java': ['google_java_format']}
# }}}1
