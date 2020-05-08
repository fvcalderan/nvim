" plugin configuration
call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
call plug#end()

" configuration for ncm2 (neovim completion manager)
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" configuration for NERDTree
autocmd STdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" configuration for lightline
set noshowmode 

"basic configuration
colo skoretheme
set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autochdir

" my custom hotkeys
let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :Files<cr>

"nnoremap <c-f> :Ag<space>
nnoremap <leader>o :NERDTreeToggle<cr> 

" easy <Esc> key
inoremap jk <Esc>
inoremap kj <Esc>

" easy insert mode movement
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w
inoremap <A-l> <C-o>l

" run python program
" nnoremap <leader>r <Esc>:w<CR>:!python3 %<CR>

" run 'run' file
nnoremap <leader>r <Esc>:w<CR>:!./run<CR>

" splits
set splitbelow
set splitright
nnoremap <leader>h <C-w>h 
nnoremap <leader>j <C-w>j 
nnoremap <leader>k <C-w>k 
nnoremap <leader>l <C-w>l 