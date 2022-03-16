if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
  finish
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lualine/lualine.nvim'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
Plug 'ellisonleao/glow.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'rust-lang/rust.vim'
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-css-color'
Plug 'machakann/vim-sandwich'
Plug 'cespare/vim-toml'
Plug 'rhysd/vim-llvm'

Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_show_icons = {
\ 'git': 0,
\ 'folders': 0,
\ 'files': 0,
\ 'folder_arrows': 0,
\ }

Plug 'ap/vim-buftabline'
let g:buftabline_indicators = 1
let g:buftabline_numbers = 2
let g:buftabline_show = 1

Plug 'ervandew/supertab'
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = 'context'

Plug 'nvim-lua/completion-nvim'
set completeopt=menu,menuone
let g:completion_enable_auto_popup = 0

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr
set foldlevel=9

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.cache/nvim/ctags'
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

call plug#end()

set expandtab               " use spaces instead of tabs
set hidden                  " hide buffers instead of closing
set ignorecase              " case insensitive search
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

set shiftwidth=0            " use tabstop
set softtabstop=-1          " use shiftwidth
set tabstop=4
augroup init_tabs | autocmd!
  autocmd filetype javascript,lua,ruby setlocal ts=2
  autocmd filetype css,html,liquid,markdown,scss setlocal ts=2
  autocmd filetype conf,json,toml,xml,yaml setlocal ts=2
  autocmd filetype sh,zsh,vim,tmux setlocal ts=2
augroup END

hi LineNr            cterm=bold ctermfg=244 ctermbg=235
hi VertSplit         cterm=bold ctermfg=246 ctermbg=246
hi TabLineSel        cterm=none
hi BufTabLineFill    cterm=none ctermfg=246 ctermbg=246
hi BufTabLineCurrent cterm=bold ctermfg=236 ctermbg=14
hi BufTabLineActive  cterm=none ctermfg=250 ctermbg=236
hi BufTabLineHidden  cterm=none ctermfg=250 ctermbg=240
hi Pmenu                        ctermfg=250 ctermbg=238
hi PmenuSel                     ctermfg=255 ctermbg=25
hi PmenuSbar                    ctermbg=234
hi PmenuThumb                   ctermfg=250

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
nnoremap <leader>a ggvG$
nnoremap <leader>q :quit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>c :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr>
nnoremap <leader>e :edit <c-r>=expand('%:p:h')<cr>/
nnoremap <leader>s :split<space>
nnoremap <leader>v :vsplit<space>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fs :Tags<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fr :Telescope live_grep<cr>
nnoremap <leader>ft :Telescope file_browser<cr>
nnoremap <leader>fm :Maps<cr>
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

function! s:FoldToggle()
  if &foldcolumn ==# '0'
    set foldcolumn=auto:3
  else
    set foldcolumn=0
  endif
endfunction
command! -nargs=0 FoldToggle call s:FoldToggle()

lua require('config')

augroup init | autocmd!
  autocmd filetype qf wincmd J
augroup END
