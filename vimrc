set nocompatible
set ai
set enc=utf8
set autochdir
set mouse=nv
set ignorecase
set history=500
set cursorline
set cursorcolumn
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set autoread

"autocomplete
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

"搜尋時忽略大小寫
set ic

"設定語法上色
syntax enable 

"Enable line display
set number 

" 在關鍵字還沒完全輸入完畢前就顯示結果
set incsearch

"backspace behavior
set backspace=indent,eol,start

"Enable clipboard 
set clipboard=unnamed

"搜尋到的文字反白顯示
set hlsearch

"###############

execute pathogen#infect()

"###############
call plug#begin('~/.vim/plugged')
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
call plug#end() 

"########Sublime theme
set t_Co=256
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

"##################### airline

let g:airline_theme='molokai'
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1

" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'

"################


"###############快速切換滑鼠模式 ctrl + M
map <C-n> :call SwitchMouseMode()<CR>
map! <C-n> <Esc>:call SwitchMouseMode()<CR>
function SwitchMouseMode()
    if (&mouse == "a")
        let &mouse = ""
        echo "Mouse is disabled."
    else
        let &mouse = "a"
        echo "Mouse is enabled."
    endif
endfunction

"##############Switch to full/simple
map <C-f> :call SwitchFullSimpleMode()<CR>
map! <C-f> <Esc>:call SwitchFullSimpleMode()<CR>
function SwitchFullSimpleMode()
    if (&mouse == "a")
        let &mouse = ""
        set nocindent
        set nonumber
        set wrap
        echo "Switch to simple mode.(nomouse, nonumber, nocindent, wrap)"
    else
        let &mouse = "a"
        set cindent
        set number
        set nowrap
        echo "Switch to full mode.(mouse, number, cindent, nowrap)"
    endif
endfunction

"############


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


"#############

"Compile and run c direct in F8
map <F8> : !gcc %; ./a.out <CR>

"##############


"### 映射切換buffer鍵
nnoremap <F7> :bp<CR>
nnoremap <F8> :bn<CR>
"### 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"###左方資料夾快捷 ctrl + N   
map <F5> :NERDTreeToggle<CR>


"#######################
