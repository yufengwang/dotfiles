"-----------------------------------------------------------------------------
" entrypoint
"-----------------------------------------------------------------------------

if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
  finish
endif

" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

"-----------------------------------------------------------------------------
" plugins
"-----------------------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'Mofiqul/vscode.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'

Plug 'ap/vim-css-color'
Plug 'ellisonleao/glow.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'machakann/vim-sandwich'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rhysd/vim-llvm'
Plug 'rust-lang/rust.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-sleuth'

Plug 'ap/vim-buftabline'
let g:buftabline_indicators = 1
let g:buftabline_numbers = 2
let g:buftabline_show = 1

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.cache/nvim/ctags'
command! -nargs=0 GutentagsClearCache
  \ call system('rm ' . g:gutentags_cache_dir . '/*')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr
set foldlevel=9

Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
let g:tagbar_width = 28

call plug#end()

"-----------------------------------------------------------------------------
" builtins
"-----------------------------------------------------------------------------

packadd! termdebug

"-----------------------------------------------------------------------------
" theme
"-----------------------------------------------------------------------------

colorscheme everforest

" hi BufTabLineFill    gui=none guifg=NvimDarkGray1 guibg=NvimDarkGray1
" hi BufTabLineCurrent gui=bold guifg=NvimDarkGray1 guibg=NvimLightGreen
" hi BufTabLineActive  gui=none guifg=NvimLightGreen guibg=NvimDarkGray3
" hi BufTabLineHidden  gui=none guifg=NvimLighGray1 guibg=NvimDarkGray3
" hi link TabLine      BufTabLineActive
" hi link TabLineFill  BufTabLineFill
" hi link TabLineSel   BufTabLineCurrent

"-----------------------------------------------------------------------------
" settings
"-----------------------------------------------------------------------------

set breakindent             " visually indent wrapped lines
set cursorline              " highlight current line
set expandtab               " use spaces instead of tabs
set hidden                  " hide buffers instead of closing
set ignorecase              " case insensitive search
set list                    " show tabs and trailing/non-breakable spaces
set mouse=a                 " enable mouse for all modes
set noshowmode              " hide current mode line
set number                  " show line numbering
set scrolloff=5             " lines above/below cursor
set sidescrolloff=5         " columns to keep when no wrap
set smartcase               " case sensitive if contains uppercase
set spelllang=en_us         " set spelling language
set splitbelow              " horizontal split to the bottom
set splitright              " vertical split to the right
set title                   " set terminal title
set undodir=/tmp/nvim/undo  " semi-persistent undo
set undofile                " save undo history

" set special display characters
lua vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

set shiftwidth=0            " use tabstop
set softtabstop=-1          " use shiftwidth
set tabstop=2

"-----------------------------------------------------------------------------
" keybindings
"-----------------------------------------------------------------------------

let mapleader = '\'

nnoremap j gj
nnoremap k gk
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprevious<cr>
nnoremap <c-x> :bprevious<bar>bdelete #<cr>
nnoremap <c-c> :cclose<cr>:lclose<cr>
nnoremap <c-f> :Files<cr>
nnoremap <leader>a ggvG$
nnoremap <leader>q :quit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>c :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr>
nnoremap <leader>e :edit <c-r>=expand('%:p:h')<cr>/
nnoremap <leader>s :split<space>
nnoremap <leader>v :vsplit<space>
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>fs :Tags<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :Rg<cr>
nnoremap <leader>fm :Maps<cr>
nnoremap <leader>fh :Helptags<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <F5> :edit<cr>
nnoremap <F6> :set spell!<cr>
nnoremap <F7> :Glow<cr>
nnoremap <F8> :FoldToggle<cr>
nnoremap <F9> :NvimTreeToggle<cr>
nnoremap <F12> :TagbarToggle<cr>
nmap <leader>1 <plug>BufTabLine.Go(1)
nmap <leader>2 <plug>BufTabLine.Go(2)
nmap <leader>3 <plug>BufTabLine.Go(3)
nmap <leader>4 <plug>BufTabLine.Go(4)
nmap <leader>5 <plug>BufTabLine.Go(5)
nmap <leader>6 <plug>BufTabLine.Go(6)
nmap <leader>7 <plug>BufTabLine.Go(7)
nmap <leader>8 <plug>BufTabLine.Go(8)
nmap <leader>9 <plug>BufTabLine.Go(9)
nmap <leader>0 <plug>BufTabLine.Go(10)

inoremap <c-h> <c-\><c-n><c-w>h
inoremap <c-j> <c-\><c-n><c-w>j
inoremap <c-k> <c-\><c-n><c-w>k
inoremap <c-l> <c-\><c-n><c-w>l
inoremap <c-s> <esc>viw~ea
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

vnoremap // y/<c-r>"<cr>

"-----------------------------------------------------------------------------
" commands & functions
"-----------------------------------------------------------------------------

function! s:FoldToggle()
  if &foldcolumn ==# '0'
    set foldcolumn=auto:3
  else
    set foldcolumn=0
  endif
endfunction
command! -nargs=0 FoldToggle call s:FoldToggle()

augroup highlight_yank | autocmd!
  autocmd TextYankPost * silent!
    \ lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})
augroup END

augroup init | autocmd!
  autocmd FileType qf wincmd J
augroup END

"-----------------------------------------------------------------------------
" configure
"-----------------------------------------------------------------------------

lua require('config')
