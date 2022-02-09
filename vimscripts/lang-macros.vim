"   __                _     _
"  / _|_   _____ __ _| | __| | ___ _ __ __ _ _ __
" | |_\ \ / / __/ _` | |/ _` |/ _ \ '__/ _` | '_ \
" |  _|\ V / (_| (_| | | (_| |  __/ | | (_| | | | |
" |_|   \_/ \___\__,_|_|\__,_|\___|_|  \__,_|_| |_|
"
" My github: https://github.com/fvcalderan/

" My lang-specific shortcuts

" C specific ==================================================================
autocmd FileType c nnoremap ,m a#include <stdio.h><CR><CR>int main(int argc,
                              \ char **argv)<CR>{}<ESC>i<CR><ESC>Oreturn 0;
                              \<ESC>O
autocmd FileType c nnoremap ,f ofor (<++>; <++>; <++>)<CR>{}<ESC>i<CR><TAB>
                              \<++><CR><ESC>?f<CR>kdd:nohlsearch<CR>
autocmd FileType c nnoremap ,p oprintf("<++>", <++>);<ESC>?p<CR>kdd
                              \:nohlsearch<CR>
autocmd FileType c nnoremap ,c yiwgg)o<++> <ESC>pa(<++>) {}<ESC>i<CR><TAB>
                              \<++><CR><ESC>o<ESC>kkkk

" Python specific =============================================================
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
autocmd Filetype python nnoremap ,r :w<CR>:!black --line-length 79 %<CR>:e<CR>
                                   \:!flake8 %<CR>

" Latex specific ==============================================================
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

" Java specific ===============================================================
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

" GDScript specific ===========================================================
autocmd FileType gdscript3 nnoremap ,r :!godot -s %<CR>
