set number
set relativenumber
set so=10
filetype plugin on
set nocompatible
""Disable beep
set vb
set encoding=utf-8
scriptencoding utf-8
execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')
syntax on
filetype plugin on
:highlight Normal ctermbg=black


""Seminarski
function SetUsLayout()
	silent !setxkbmap us
endfunction

function SetRsLayout()
	silent !setxkbmap -layout rs
endfunction

"autocmd InsertLeave * call SetUsLayout()
"autocmd InsertEnter * call SetRsLayout()



""Vim tab key
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

""supertab
"let g:SuperTabContextDefaultCompletionType = "<c-p>"
"let g:SuperTabContextDefaultCompletionType = "<c-p>"
"let g:SuperTabDefaultCompletionType = "<c-n>"

"" ctags
nnoremap <leader>. :CtrlPTag<cr>

"" CTAGS + TAGBAR
nnoremap <silent>,<Leader>b :TagbarToggle<CR>


""Vimtex
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in thedocumentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","


""Automatic TeX Plugin= ATP
"let g:atp_Compiler='bash'
"let g:tex_flavor='pdflatex'
"let g:LatexBox_latexmk_async=0
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_quickfix=2
""let g:LaTeXBox_output_type='' "Let latexmkrc choose the type 
"let g:LatexBox_viewer = 'zathura'



" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



""Old YMC c++
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

""Youcompleteme qt
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_qt.py"
"
""Youcompleteme gtk
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_gtk+3.py"
"
""Youcompleteme gtkmm
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_gtkmm3.py"



"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_global_ycm_extra_conf = '/home/andy/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"" YCM Defaults
let g:ycm_collect_identifiers_from_tags_files = 1 " Disable if takes too much ram
let g:ycm_semantic_completion_toggle = '<c-f>'
let g:ycm_seed_identifiers_with_syntax = 1
let g:clang_use_library = 1
let g:clang_complete_macros = 1
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'],
			\ 'vim': ['re![_a-zA-Z]+[_\w]*\.'], 
			\'erlang': [':'], 'c': ['->', '.'], 
			\ 'perl': ['->'],
			\ 'lua': ['.', ':'],
			\ 'cs,javascript,d,python,perl6,scala,vb,elixir,go': ['.'],
			\ 'php': ['->', '::'],
			\ 'objc': ['->', '.'],
			\ 'ocaml': ['.', '#'],
			\'ruby': ['.', '::'], 
			\ 'java,jsp': ['.'] }

			""\ 'python': ['.'],

"let g:ycm_show_diagnostics_ui = 0
"
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_auto_trigger = 1


" Documentation in YCM
let g:ycm_add_preview_to_completeopt = 1


"For completion opengl not opengl ES
"let g:clang_user_options = ' -DCLANG_COMPLETE_ONLY'

augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

""Vim Splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""Vim Tabs 
		
map H :tabprevious<CR>
map L :tabnext<CR>

nnoremap <F3> :tabnew <CR>
nnoremap <F4> :tabclose <CR>

""Vim Tabs in terminal mode

tnoremap <C-w><S-h> <C-w>gT
tnoremap <C-w><S-l> <C-w>gt

tnoremap <C-w><C-J> <C-W><C-J>
tnoremap <C-w><C-K> <C-W><C-K>
tnoremap <C-w><C-L> <C-W><C-L>
tnoremap <C-w><C-H> <C-W><C-H>

""TagBar

noremap <F1> <Nop>

map <F1> :Tagbar<CR>
nmap <F1> :TagbarTogglePause<CR>

""Disable Arrows	
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


map <C-Left> :call RotateLeft()<CR>
map <C-Right> :call RotateRight()<CR>

"" Nerdtree

map <F2> :NERDTreeToggle<CR>


"" Syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 0
let g:cpp_experimental_template_highlight = 0
let g:cpp_concepts_highlight = 1


""" OPENGL
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

"""C++
autocmd BufNewFile *.cpp r /path/to/file.cpp
"map <F8> :!g++ -std=c++14 % -lglfw -lGL -lGLU -lglut -lGL -Wall -lglut -lGLEW    && ./a.out <CR> 
"""let g:SuperTabDefaultCompletionType = "<c-n>"

"""BASIC TOOLS
"Navigating with guides
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"map <Space><Space> <Esc>/<++><Enter>"_c4l
"inoremap ;gui <++>
"For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
inoremap jw <Esc>
inoremap wj <Esc>
inoremap <C-l> <Space><Space>
"""END


"""HTML
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ;c1  <h1><center><++></center></h1><Enter><Enter><++><Esc>3kf<i
autocmd FileType html inoremap ;c2  <h2><center><++></center></h2><Enter><Enter><++><Esc>3kf<i
autocmd FileType html inoremap ;c3  <h3><center><++></center></h3><Enter><Enter><++><Esc>3kf<i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;li <li><++></li><Enter><Enter><++><Esc>
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
"""END


"""Latex
autocmd FileType tex inoremap ;sssc \subsubsection{<++>}<Enter><Enter><++>
autocmd FileType tex inoremap ;ssc \subsection{<++>}<Enter><Enter><++>
autocmd FileType tex inoremap ;sc \section{<++>}<Enter><Enter><++>
autocmd FileType tex inoremap ;ul \underline{<++>}
autocmd FileType tex inoremap ;li \emph{<++>}
autocmd FileType tex inoremap ;il \textit{<++>}
autocmd FileType tex inoremap ;ref \ref{<++>}
autocmd FileType tex inoremap ;lb \label{<++>}
autocmd FileType tex inoremap ;bf \textbf{<++>}
autocmd FileType tex inoremap ;enu \begin{enumerate}<Enter>\item <++><Enter>\end{enumerate}
autocmd FileType tex inoremap ;it \begin{itemize}<Enter>\item <++><Enter>\end{itemize}
autocmd FileType tex inoremap ;tif \titleformat{<++>}<Enter>{<++>}<Enter>{<++>}<Enter>{<++>}<Enter>{<++>}
autocmd FileType tex inoremap ;img \includegraphics[scale=<++>]{<++>}
autocmd FileType tex inoremap ;text \textnormal{<++>}
autocmd FileType tex inoremap ;mvv \vspace*{<++>}{<++>}
autocmd FileType tex inoremap ;mvh \hspace*{<++>}{<++>}
autocmd FileType tex inoremap ;tab \begin{tabular}{<++>}<enter><++><enter>\end{tabular}
autocmd FileType tex inoremap ;mcl \multicolumn{<++>}{<++>}{<++>}

"""Latex Math
autocmd FileType tex inoremap ;raz $\frac{<++>}{<++>}$
autocmd FileType tex inoremap ;kor \sqrt{<++>}
autocmd FileType tex inoremap ;koz {\sqrt{\frac{<++>}{<++>}}
autocmd FileType tex inoremap ;sum \displaystyle\sum_{<++>}^{<++>}
autocmd FileType tex inoremap ;inf \infty


"""JAVA
autocmd FileType java inoremap ;main public<Space>class<Space><++><Enter>{<Enter><Enter>public<Space>static<Space>void<Space>main(String[]<Space>args){<Enter><++><Enter>}<Enter><Enter>} 
autocmd FileType java inoremap ;class public<Space>class<Space><++><Enter>{<Enter><Enter><++><Enter><Enter>} 

"""C++
autocmd FileType cpp inoremap ;ios #include<Space><iostream>
autocmd FileType cpp inoremap ;cma #include<Space><cmath>
autocmd FileType cpp inoremap ;stri #include<Space><string>
autocmd FileType cpp inoremap ;iom #include<Space><iomanip>
autocmd FileType cpp inoremap ;cst #include<Space><cstdlib>
autocmd FileType cpp inoremap ;cti #include<Space><ctime>
autocmd FileType cpp inoremap ;cct #include<Space><cctype>
autocmd FileType cpp inoremap ;vec #include<Space><vector>
autocmd FileType cpp inoremap ;deq #include<Space><deque>
autocmd FileType cpp inoremap ;lis #include<Space><list>
autocmd FileType cpp inoremap ;deq #include<Space><deque>
autocmd FileType cpp inoremap ;mem #include<Space><memory>
autocmd FileType cpp inoremap ;alg #include<Space><algorithm>
autocmd FileType cpp inoremap ;utl #include<Space><utility>
autocmd FileType cpp inoremap ;exc #include<Space><stdexcept>

autocmd FileType cpp inoremap ;incc #include<Space><<++>><Enter><++>
autocmd FileType cpp inoremap ;incv #include<Space>"<++>"<Enter><++>


autocmd FileType cpp inoremap ;fst #include<Space><fstream>
autocmd FileType cpp inoremap ;ifs #include<Space><ifstream>
autocmd FileType cpp inoremap ;ofs #include<Space><ofstream>
autocmd FileType cpp inoremap ;sst #include<Space><sstream>

autocmd FileType cpp inoremap ;for <Enter>for<Space>(<++>)<Enter>{<Enter><Enter><++><Enter><Enter>}
autocmd FileType cpp inoremap ;swi <Enter>switch<Space>(<++>)<Enter>{<Enter><Enter>case<Space><++>:<Enter><Enter>}
autocmd FileType cpp inoremap ;whi while<Space>(<++>)<Enter>{<Enter><Enter><++><Enter><Enter>}
autocmd FileType cpp inoremap ;cla class<Space><++><Enter>{<Enter>protected:<Enter><++><Enter>private:<Enter><++><Enter><Enter>public:<Enter><++><Enter><Enter>};
autocmd FileType cpp inoremap ;stru struct<Space><++><Enter>{<Enter><++><Enter>};
autocmd FileType cpp inoremap ;fun <++><Enter>{<Enter><++><Enter>}
autocmd FIleType cpp inoremap ;tem template <class <++>><Enter><++><Enter>{<Enter><++>
"""cmath
autocmd FileType cpp inoremap ;pow pow()<Esc>i
autocmd FileType cpp inoremap ;siz sizeof()<Esc>i
"""iomanip
autocmd FileType cpp inoremap ;cas static_cast<<++>>(<++>)
autocmd FileType cpp inoremap ;pre setprecision(<++>)
autocmd FileType cpp inoremap ;set setw(<++>)
autocmd FileType cpp inoremap ;sho showpoint
autocmd FileType cpp inoremap ;fix fixed


"""string
autocmd FileType cpp inoremap ;gli getline(cin,<Space><++>)
autocmd FIleType cpp inoremap ;stc strcpy(<++>,<Space><++>)



"""C++ Expresions
autocmd FileType cpp inoremap ;cge cin.get()
autocmd FileType cpp inoremap ;cig cin.ignore()
autocmd FileType cpp inoremap ;sas <++>.assign(<++>,<Space>'<++>')
autocmd FileType cpp inoremap ;sle <++>.length()
autocmd FileType cpp inoremap ;cwi cin.width()
autocmd FileType cpp inoremap ;cgli cin.getline()
autocmd FIleType cpp inoremap ;tup toupper('<++>')
autocmd FileType cpp inoremap ;scl system("clear");
autocmd FileType cpp inoremap ;int int<Space>main()<Enter>{<Enter><Enter><++><Enter><Enter>} 

"""C++ Files
"autocmd FileType cpp inoremap ;
autocmd FileType cpp inoremap ;ofo <++>.open("<++>");<Enter><++>
autocmd FileType cpp inoremap ;cfc <++>.close();<Enter><++>
"autocmd FileType cpp inoremap ;ifl ifstream
"autocmd FileType cpp inoremap ;ofl ofstream

"""Vectors
autocmd FileType cpp inoremap ;vst vector<<++>><Space><++>{<++>};<Enter><++>
autocmd FileType cpp inoremap ;vcl clear();
autocmd FileType cpp inoremap ;vrm pop_back();
autocmd FileType cpp inoremap ;val push_back(<++>)<++>
autocmd FileType cpp inoremap ;vsi size();
autocmd FileType cpp inoremap ;vem empty();


"""C++ Smart Pointers
autocmd FileType cpp inoremap ;unip unique_ptr<<++>> <++>(<++>
autocmd FileType cpp inoremap ;unim move(<++>

