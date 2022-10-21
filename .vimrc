" Install Plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc

" Bloat Plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" Settings
filetype plugin on
syntax on
set nocp nosmd nowrap wmnu nosc nosol ic is hls tgc
set bg=dark enc=utf-8 tw=80 ls=0 vif=NONE ts=4 shiftwidth=4
set ignorecase noswapfile confirm clipboard=unnamedplus
set backspace=indent,eol,start
set number splitbelow

" Visual
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Keymap
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :q!<CR>
nnoremap <silent> <C-x>    :so $MYVIMRC<cr>
nnoremap q :q<CR>

" Yank to xclip
function Xclip() range
  call system('xclip -selection c,p', @r)
  echo line("'>") - line("'<") + 1 "lines yanked to clipboard"
endfunction
vnoremap <C-y> "ry:call Xclip()  <cr>"
