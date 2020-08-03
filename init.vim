"   __                _     _
"  / _|_   _____ __ _| | __| | ___ _ __ __ _ _ __
" | |_\ \ / / __/ _` | |/ _` |/ _ \ '__/ _` | '_ \
" |  _|\ V / (_| (_| | | (_| |  __/ | | (_| | | | |
" |_|   \_/ \___\__,_|_|\__,_|\___|_|  \__,_|_| |_|
"
" My github: https://github.com/fvcalderan/

" plugin configuration
call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdtree'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'dikiaap/minimalist'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" configuration for NERDTree
autocmd STdinReadPre * let s:std_in=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" configuration for airline
" set noshowmode
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='minimalist'
"let g:airline_powerline_fonts = 1

" configuration for lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

"basic configuration
set clipboard+=unnamedplus
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

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=red gui=underline ctermfg=red cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=yellow gui=underline ctermfg=yellow cterm=underline
augroup END

" colors and theme - dracula
set termguicolors
colorscheme dracula
syntax on

" colors and theme - minimalist
"set fillchars+=vert:\
"set t_Co=256
"syntax on
"colorscheme minimalist
":highlight Pmenu ctermbg=08 guibg=gray " for coc menu

" my custom hotkeys
let mapleader="\<space>"
nnoremap <silent> <leader>o :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>b :buffers<CR>:b<Space>

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

" Custom compiling/running options for various languages
" General (run shell script)
nnoremap <leader>r <Esc>:w<CR>:!./run<CR>
" Latex compiling
nnoremap <leader>pr <Esc>:w<CR>:!~/dotfiles/scripts/latex_compile %:p<CR>

" My leader+key lang-specific shortcuts

" Latex specific
nnoremap <leader>pv o<CR>\vspace{5mm}<CR><CR>
nnoremap <leader>pb a\textbf{}<ESC>i
nnoremap <leader>ps a$$<Esc>i

" Java specific
nnoremap <leader>jc ipublic class <Esc>:r!echo %<CR>i<BS><Esc>A<BS><BS><BS><BS><BS> {<CR><CR>}<Esc>ki<Tab>
nnoremap <leader>ji ipublic interface <Esc>:r!echo %<CR>i<BS><Esc>A<BS><BS><BS><BS><BS> {<CR><CR>}<Esc>ki<Tab>
nnoremap <leader>jm opublic static void main (String args[]) {<CR><CR>}<Esc>ki<Tab><Tab>
nnoremap <leader>jp oSystem.out.println();<Esc>hi

" CoC Configuration
source ~/.config/nvim/vim-plugins/coc-config.vim
