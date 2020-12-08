"   __                _     _
"  / _|_   _____ __ _| | __| | ___ _ __ __ _ _ __
" | |_\ \ / / __/ _` | |/ _` |/ _ \ '__/ _` | '_ \
" |  _|\ V / (_| (_| | | (_| |  __/ | | (_| | | | |
" |_|   \_/ \___\__,_|_|\__,_|\___|_|  \__,_|_| |_|
"
" My github: https://github.com/fvcalderan/

" plugin configuration (VimPlug) ==============================================
call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'voldikss/vim-floaterm'
call plug#end()

" leader key ==================================================================
let mapleader="\<space>"

" configuration for NERDTree ==================================================
autocmd STdinReadPre * let s:std_in=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
                                     \ && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
nnoremap <silent> <leader>o :NERDTreeToggle<cr>

" configuration for lightline =================================================
set noshowmode
let g:lightline = {'colorscheme': 'dracula'}

" quickscope ==================================================================
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=red
                                \ gui=underline ctermfg=red cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=yellow
                                \ gui=underline ctermfg=yellow cterm=underline
augroup END

" floaterm ====================================================================
let g:floaterm_wintype="normal"
nnoremap <silent> <leader><CR> :FloatermToggle<CR>
tnoremap <silent> <C-x> <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

" colors and theme - dracula ==================================================
set termguicolors
colorscheme dracula
syntax on
hi Normal guibg=NONE ctermbg=NONE

" basic configuration =========================================================
filetype plugin on
set clipboard+=unnamedplus
set hidden
set number
set relativenumber
set mouse=a
set autochdir
set wildmode=longest:full,full
set splitbelow splitright
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e
" tabs
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" nvim only ===================================================================
set inccommand=split
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" vim only ====================================================================
" set laststatus=2
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"
" nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
" nnoremap <leader>sv :source ~/.vim/vimrc<cr>

" my custom hotkeys ===========================================================

" show open buffers and change to buffer n
nnoremap <leader>b :buffers<CR>:b<Space>
" remove search highlight
nnoremap <silent> <leader>/ :nohlsearch<CR>
" 80 characters limit bar
nnoremap <silent> <leader>c :set cc=80<CR>
nnoremap <silent> <leader>C :set cc=0<CR>
" show date, time and battery
nnoremap <silent> <leader>' :!echo $(date +"\%F \%R") BAT:
                           \ $(cat /sys/class/power_supply/BAT1/capacity)\%<CR>
" splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Custom compiling/running options ============================================
" General (run shell script)
nnoremap <leader>r <Esc>:w<CR>:!./run<CR>
" Latex compiling
autocmd FileType tex nnoremap <leader>lr
                        \ <Esc>:w<CR>:!~/.config/scripts/latex_compile %:p<CR>

" Fast tab to guide ===========================================================
inoremap <C-Space> <Esc>/<++><CR>c4l
vnoremap <C-Space> <Esc>/<++><CR>c4l
nnoremap <C-Space> <Esc>/<++><CR>c4l

" My lang-specific shortcuts ==================================================
source ~/.config/nvim/vimscripts/lang-macros.vim
