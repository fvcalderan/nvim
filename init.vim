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
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'voldikss/vim-floaterm'
call plug#end()

" configuration for NERDTree
autocmd STdinReadPre * let s:std_in=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
                                     \ && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" configuration for lightline
set noshowmode
let g:lightline = {'colorscheme': 'dracula'}

"basic configuration
filetype plugin on
set clipboard+=unnamedplus
set hidden
set number
set relativenumber
set mouse=a
set autochdir

" nvim only
set inccommand=split

" vim only
" set laststatus=2
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"

" disable auto-next-line-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" autocomplete menu
set wildmode=longest:full,full

" delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

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
  autocmd ColorScheme * highlight QuickScopePrimary guifg=red
                                \ gui=underline ctermfg=red cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=yellow
                                \ gui=underline ctermfg=yellow cterm=underline
augroup END

" colors and theme - dracula
set termguicolors
colorscheme dracula
syntax on
hi Normal guibg=NONE ctermbg=NONE

" my custom hotkeys
let mapleader="\<space>"
nnoremap <silent> <leader>o :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>b :buffers<CR>:b<Space>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>c :set cc=80<CR>
nnoremap <silent> <leader>C :set cc=0<CR>

" show date, time and battery
nnoremap <silent> <leader>' :!echo $(date +"\%F \%R") BAT:
                           \ $(cat /sys/class/power_supply/BAT1/capacity)\%<CR>

" splits
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" term
" tnoremap <silent> <C-x> <C-\><C-n>

" floaterm
let g:floaterm_wintype="normal"
nnoremap <silent> <leader><CR> :FloatermToggle<CR>
tnoremap <silent> <C-x> <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

" Fast tab to guide
inoremap <C-Space> <Esc>/<++><CR>c4l
vnoremap <C-Space> <Esc>/<++><CR>c4l
nnoremap <C-Space> <Esc>/<++><CR>c4l

" Custom compiling/running options for various languages
" General (run shell script)
nnoremap <leader>r <Esc>:w<CR>:!./run<CR>
" Latex compiling
nnoremap <leader>lr <Esc>:w<CR>:!~/.config/scripts/latex_compile %:p<CR>

" My leader+key lang-specific shortcuts

" C specific
autocmd FileType c nnoremap ,m a#include <stdio.h><CR><CR>int main(int argc,
                              \ char **argv)<CR>{}<ESC>i<CR><ESC>Oreturn 0;
                              \<ESC>O
autocmd FileType c nnoremap ,f ofor (<++>; <++>; <++>)<CR>{}<ESC>i<CR><TAB>
                              \<++><CR><ESC>?f<CR>kdd:nohlsearch<CR>
autocmd FileType c nnoremap ,p oprintf("<++>", <++>);<ESC>?p<CR>kdd
                              \:nohlsearch<CR>
autocmd FileType c nnoremap ,c yiwgg)o<++> <ESC>pa(<++>) {}<ESC>i<CR><TAB>
                              \<++><CR><ESC>o<ESC>kkkk

" Python specific
autocmd Filetype python nnoremap ,m a#imports<CR><CR>def main():<CR>q<CR><CR>
                                   \<BS>if __name__ ==
                                   \ '__main__':<CR>main()<ESC>?q<CR>
                                   \:nohlsearch<CR>xi
autocmd Filetype python nnoremap ,ff ofor <++> in <++>:<CR><++><ESC>kkdd
autocmd Filetype python nnoremap ,fr ofor <++> in range(<++>):<CR><++><ESC>kkdd
autocmd Filetype python nnoremap ,fe ofor <++>, <++> in enumerate(<++>):
                                    \<CR><++><ESC>kkdd
autocmd Filetype python nnoremap ,p oprint(f"{}")<ESC>kddf{a
autocmd Filetype python nnoremap ,ll oq = [<++> for <++> in <++>]<ESC>kdd0fqxi
autocmd Filetype python nnoremap ,lr oq = [<++> for <++> in range(<++>)]
                                    \<ESC>kdd0fqxi
autocmd Filetype python nnoremap ,c yiwgg)odef <ESC>pa(<++>) -> <++>:<CR><++>
                                   \<CR><ESC>kk

" Latex specific
autocmd FileType tex nnoremap ,v o<CR>\vspace{5mm}<CR><CR>
autocmd FileType tex nnoremap ,b a\textbf{}<ESC>i
autocmd FileType tex vnoremap ,b s\textbf{}<ESC>hpf}<Space>
autocmd FileType tex nnoremap ,i a\textit{}<ESC>i
autocmd FileType tex vnoremap ,i s\textit{}<ESC>hpf}<Space>
autocmd FileType tex nnoremap ,s a$$<Esc>i
autocmd FileType tex vnoremap ,s s$$<ESC>hpf$<Space>
autocmd FileType tex nnoremap ,g a\includegraphics[width=<++>\textwidth]{<++>}
                                 \<ESC>Fnhh
autocmd FileType tex nnoremap ,[ a\[\]<ESC>hi<CR><ESC>O
autocmd FileType tex nnoremap ,q o\newpage<CR><CR>\textbf{Questão <++>}<CR><CR>
                                \\hrule<CR>\vspace{5mm}<CR><CR><++><ESC>?n<CR>h
                                \:nohlsearch<CR>

" Java specific
autocmd FileType java nnoremap ,c ipublic class <Esc>:r!echo
                                         \ %<CR>i<BS><Esc>A<BS><BS><BS><BS><BS>
                                         \ {<CR><CR>}<Esc>ki<Tab>
autocmd FileType java nnoremap ,i ipublic interface <Esc>:r!echo
                                         \ %<CR>i<BS><Esc>A<BS><BS><BS><BS><BS>
                                         \ {<CR><CR>}<Esc>ki<Tab>
autocmd FileType java nnoremap ,m opublic static void main
                                         \ (String args[]) {<CR><CR>}<Esc>ki
                                         \ <Tab><Tab>
autocmd FileType java nnoremap ,p oSystem.out.println();<Esc>hi
