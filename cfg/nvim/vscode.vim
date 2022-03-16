set expandtab               " use spaces instead of tabs
set ignorecase              " case insensitive search
set smartcase               " case sensitive if contains uppercase
set splitbelow              " horizontal split to the bottom
set splitright              " vertical split to the right

let mapleader = '\'

nnoremap <leader>a ggvG$
nnoremap <leader>c :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr>
nnoremap <leader>s :split<space>
nnoremap <leader>v :vsplit<space>

vnoremap // y/<c-r>"<cr>
