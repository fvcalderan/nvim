" plugin configuration
call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'dikiaap/minimalist'
Plug 'voldikss/vim-floaterm'
call plug#end()

" configuration for NERDTree
autocmd STdinReadPre * let s:std_in=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" configuration for airline
set noshowmode 

"basic configuration
set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set autochdir

" tabs
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" colors and theme - minimalist
set fillchars+=vert:\ 
set t_Co=256
syntax on
colorscheme minimalist
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" my custom hotkeys
let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :Files<cr>

"nnoremap <c-f> :Ag<space>
nnoremap <silent> <leader>o :NERDTreeToggle<cr> 

" easy <Esc> key (useless now, after Caps/Esc swap)
" inoremap jk <Esc>
" inoremap kj <Esc>

" easy insert mode movement
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w
inoremap <A-l> <C-o>l

" splits
set splitbelow
set splitright
nnoremap <leader>h <C-w>h 
nnoremap <leader>j <C-w>j 
nnoremap <leader>k <C-w>k 
nnoremap <leader>l <C-w>l 

" floaterm
nnoremap <silent> <leader>t<CR> :FloatermNew<CR>
nnoremap <silent> <leader>ty :FloatermNew python3 -q<CR>
nnoremap <silent> <leader>tm :FloatermNew vifm<CR>
nnoremap <silent> <leader>tv :FloatermNew nvim<CR>
tnoremap <silent> <F9>  <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <F10> <C-\><C-n>:FloatermKill<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

" My leader+key lang-specific shortcuts

" Custom compiling/running options for various languages
" General (run shell script)
nnoremap <leader>r <Esc>:w<CR>:!./run<CR>
" Latex compiling
nnoremap <leader>lr <Esc>:w<CR>:!~/dotfiles/scripts/latex_compile %:p<CR>

" Java specific
nnoremap <leader>jc ipublic class <Esc>:r!echo %<CR>i<BS><Esc>A<BS><BS><BS><BS><BS> {<CR><CR>}<Esc>ki<Tab>
nnoremap <leader>jm opublic static void main (String args[]) {<CR><CR>}<Esc>ki<Tab><Tab>
nnoremap <leader>jp oSystem.out.println();<Esc>hi
