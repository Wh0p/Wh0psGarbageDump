" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Daniel Opitz 
"
"
"
" Keymaps by this file:
"
" <F4>            Switch headder/source file (FileSwitch)
"
" n<C-A>          paraMark:NextArg jumps to the next function parameter and marks it in visual mode
" i<C-A>          paraMark:NextArg jumps to the next function parameter and marks it in visual mode
" v<C-A>          paraMark:NextArg jumps to the next function parameter and marks it in visual mode
" i<C-D>d|1-0     Copy the function header from the preview window
"
" n<C-H/L/J/K>    Navigate to left/right/up/down split window
" n<C-X/Z>        Navigate to next/previous tab window
"
" n<C-S>          Save file
" i<C-S><C-S>     Save file
" ni<C-S><C-A>    Save all
" n<C-E><C-E>     Quit file
" n<C-E><C-A>     Save session and exit all
"
" n<C-Up/Down>    Open close errorlist after compile
" n<C-Left/Right> Navigate to next/previsous error
"
" n<leader>df     Format code of current buffer via astyle
" n<leader>o      Launch CtrlP
" n<leader>p      Launch RangerChooser
"
" n<leader>r      search replace word under cursor
" n<leader>f      find word under cursor
" n<leader>hl     toggle highlight search
" n<leader>ag     start Ag in new tab


 







" ================================================== 
" ABLE VI COMPATIBILITY 
" ================================================== 
set nocompatible

" ================================================== 
" PLUGINS
" ================================================== 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'Wh0p/FSwitch'
Plugin 'Wh0p/paraMark'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'bling/vim-airline'
Plugin 'lervag/vim-latex'
filetype plugin indent on



" ================================================== 
" LEADER KEY
" ================================================== 
:let mapleader = ","
:let maplocalleader = "\\"



" ================================================== 
" Ad ingnore docs
" ================================================== 
let g:ag_prg="ag --column --nogroup --noheading --ignore-dir=docs"
nnoremap <leader>ag :tabe<Cr>:Ag 



" ================================================== 
" CtrlP shortcuts and ingnore
" ================================================== 
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>o :tabe<CR>:CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|build$\|docs$',
  \ 'file': '\.out$\|\.dat$'
  \ }
let g:ctrlp_working_path_mode = ''




" ================================================== 
" YouCompleteMe configs
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 0
nnoremap <leader>cc :YcmDiag<CR>

" Make ycm and ultisnips play along
let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType='<C-n>'
let g:SuperTabCrMapping=0

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'



" ================================================== 
" Airline config
" ================================================== 
set laststatus=2
let g:airline_left_sep = '⯈' 
let g:airline_left_alt_sep = '>'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#left_sep = '⯈' 
let g:airline#extensions#tabline#left_alt_sep = '>'



" ================================================== 
" YouCompleteMe configs
" ================================================== 
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '!>'
let g:ycm_warning_symbol = 'o>'
nnoremap <leader>cc :YcmDiag<CR>

" Make ycm and ultisnips play along
let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType='<C-n>'
let g:SuperTabCrMapping=0

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'



" ================================================== 
" paraMark mappings
" ================================================== 
nnoremap <C-A> :NextArg<CR>
inoremap <C-A> <ESC>:NextArg<CR>
vnoremap <C-A> <ESC>:NextArg<CR>

" Copy the parameter list for up to 10 diferent overloads
inoremap <C-D>d <ESC>:CpyParamList 1<CR>
inoremap <C-D>1 <ESC>:CpyParamList 1<CR>
inoremap <C-D>2 <ESC>:CpyParamList 2<CR>
inoremap <C-D>3 <ESC>:CpyParamList 3<CR>
inoremap <C-D>4 <ESC>:CpyParamList 4<CR>
inoremap <C-D>5 <ESC>:CpyParamList 5<CR>
inoremap <C-D>6 <ESC>:CpyParamList 6<CR>
inoremap <C-D>7 <ESC>:CpyParamList 7<CR>
inoremap <C-D>8 <ESC>:CpyParamList 8<CR>
inoremap <C-D>9 <ESC>:CpyParamList 9<CR>
inoremap <C-D>0 <ESC>:CpyParamList 0<CR>








" ================================================== 
" TEXT ENCODING AND FORMATTING
" ================================================== 
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" use indentation of previous line and indentation for C
set autoindent
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab 
" wrap lines but do not insert any linebreaks
set wrap
set textwidth=0
set wrapmargin=0
" turn on syntaxhighlight with colorscheme candycode
set t_Co=256
syntax on
colorscheme candycode
" turn relative line numbers on
set number
set relativenumber
" highlight matching braces and cursor line
set cursorline
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" gvim options remove toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=L
" gvim font
set guifont=Droid\ Sans\ Mono\ 10

" folds
set foldmethod=syntax
set foldlevel=0
set foldenable

" enable spelling for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72


" ================================================== 
" ASTYLE STUFF
" ================================================== 
" trim lines at the end of file
func! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunc

" astyle formatting
func! FormatCode(cmd)
  let pos = getpos(".")
  exec "%!" . a:cmd
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos(".", pos)
endfunction

" set the shortcut only for code
if executable("astyle")
  let astyle = "astyle --style=allman --indent=spaces=2 --indent-switches --indent-namespaces --indent-preproc-define --indent-preproc-cond --indent-col1-comments --min-conditional-indent=0 --pad-oper --pad-header --unpad-paren --align-pointer=type --align-reference=type --convert-tabs --close-templates --break-after-logical" 
  
  autocmd Filetype cxx,cpp,c,h,hpp nnoremap <leader>df :call FormatCode(astyle)<CR>
endif




" ================================================== 
" EDITING
" ================================================== 
inoremap <C-V> <ESC>pi
noremap <C-V> p
vnoremap <C-C> y
" search replace/find word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <leader>f /\<<C-r><C-w>\>

let g:toggle_search_hl_indicator = 0
func! ToggleSearchHL()
  if g:toggle_search_hl_indicator == 0
    exec ":set hlsearch"
    echo "Search hightlight on"
    let g:toggle_search_hl_indicator = 1
  else
    exec ":set nohlsearch"
    echo "Search hightlight off"
    let g:toggle_search_hl_indicator = 0
  endif
endfunc

nnoremap <leader>hl :call ToggleSearchHL()<CR>

" auto close curly bracket
autocmd Filetype cxx,cpp,c,h,hpp,tex,bib inoremap { {}<ESC>i



" ================================================== 
" CURSOR MOVEMENT
" ================================================== 
" center screen with space, on search next/previous, GOTO line
nnoremap <space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
set scrolloff=25

nnoremap <Up> <NOP>
vnoremap <Up> <NOP>
nnoremap <Down> <NOP>
vnoremap <Down> <NOP>
nnoremap <Left> <NOP>
vnoremap <Left> <NOP>
nnoremap <Right> <NOP>
vnoremap <Right> <NOP>




" ================================================== 
" WINDOW SPLITS AND TABS
" ================================================== 
" open new split planes to right and bottom
set splitbelow
set splitright
" remap split window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
"" tab cycle
nnoremap <C-X> :tabn<CR>
inoremap <C-X> <ESC>:tabn<CR>a
nnoremap <C-Z> :tabp<CR>
inoremap <C-Z> <ESC>:tabp<CR>a
" new tab
nnoremap <C-W><C-T> :tabe<CR>
" switch between header/source with F4
nnoremap <F4> :FSHere<CR>
nnoremap <leader>; :FSHere<CR>
nnoremap <leader># :tab split<CR>:FSHere<CR>








" ================================================== 
" LOAD SAVE KEYMAPS FILES
" ==================================================  
" save file
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a
" save all
nnoremap <C-S><C-A> :wa<CR>
inoremap <C-S><C-A> <ESC>:wa<CR>a
" save all, save session, exit all
nnoremap <C-E><C-E> :bd<CR>
nnoremap <C-E><C-A> :mks!<CR> :qa<CR>



" ================================================== 
" BUILD AND DEBUG KEYMAPS
" ==================================================  
" make project 
autocmd Filetype cxx,cpp,c,h,hpp map <F7> :make -C ./build/<CR>
" make clean
autocmd Filetype cxx,cpp,c,h,hpp map <S-F7> :make clean all -C ./build/<CR>
" open/close errorlist and navigate errors
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Up> :cw<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Down> :ccl<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Left> :cp<CR>
autocmd Filetype cxx,cpp,c,h,hpp nnoremap <C-Right> :cn<CR>



