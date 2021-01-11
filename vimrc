
"Author:    Kirill Ponur    
"------------------------------------------------------------
" 1. Plugins
"------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'terryma/vim-multiple-cursors'
    "Default mapping
    let g:multi_cursor_start_word_key      = '<C-n>'
    let g:multi_cursor_select_all_word_key = '<A-n>'
    let g:multi_cursor_start_key           = 'g<C-n>'
    let g:multi_cursor_select_all_key      = 'g<A-n>'
    let g:multi_cursor_next_key            = '<C-n>'
    let g:multi_cursor_prew_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'


    Plug 'lifepillar/vim-mucomplete'
    let g:mucomplete#enable_auto_at_startup = 1
    let g:mucomplete#chains = {}
    let g:mucomplete#chains.default =['path', 'omni', 'keyn', 'dict', 'spel']
    let g:mucomplete#completion_delay = 1

    Plug 'scrooloose/nerdcommenter'
    Plug 'lyokha/vim-xkbswitch'
    let g:XkbSwitchEnabled = 1 

    Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
    Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
    Plug 'kannab98/vim-monokai'

    """""""""""""""""""""""""""""""
    "  Language specific plugins  "
    """""""""""""""""""""""""""""""
    "

    if filereadable('/usr/bin/python')
        Plug 'kh3phr3n/python-syntax',        { 'for': 'python' }
        Plug 'davidhalter/jedi-vim',          { 'for': 'python' }
        Plug 'python-mode/python-mode',       { 'for': 'python' , 'branch': 'develop'}
        let g:python_higlight_all = 1
        let g:pymode_run_bind = '<leader>b'
        let g:pymode_breakpoint_bind = '<leader>bp'
        let g:pymode_lint_on_write = 0

        "let g:jedi#auto_initialization=1
        "let g:jedi#configure_call_signatures=1
        "let g:jedi#show_call_signatures_delay=30
        "let g:jedi#popup_on_dot = 0  " It may be 1 as well

        "call pymode#default('g:pymode_run_bind', '<leader>p')
    endif


    if filereadable('/usr/bin/pdflatex')
        Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
        Plug 'lervag/vimtex'                , { 'for': 'tex' }
        Plug 'kannab98/vim-latex'           , { 'for': 'tex' }
    endif

    if filereadable('/usr/bin/ranger')
        Plug 'francoiscabrol/ranger.vim'
    endif

    if has('unix')
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        "for first running: pip install unidecode                        
        let g:UltiSnipsExpandTrigger       = "<tab>"
        let g:UltiSnipsJumpForwardTrigger  = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
        let g:UltiSnipsSnippetDirectories  = ["UltiSnips", $HOME . "/.vim/"]
    endif



    Plug 'airblade/vim-gitgutter'
    "
call plug#end()



filetype plugin indent on
set completeopt-=preview
set completeopt+=longest,menuone,noinsert,noselect
set noinfercase
set shortmess+=c

"------------------------------------------------------------
" 2. Language and encoding
"------------------------------------------------------------
language en_US.utf8 
let $LANG          ='en_US'
set langmenu       =en_US
set termencoding   =utf-8
set fileencodings  =utf-8
set fileformats    =unix,dos,mac
set spelllang=ru,en
"------------------------------------------------------------
" 3. Features
""------------------------------------------------------------
" Auto change current working directory, after change buffer
set autochdir

" No annoying sound on errors
set noerrorbells
set novisualbell

set wildmenu
set wildchar=<TAB>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set exrc
set secure
" Enable syntax highlighting
syntax on
" Line numbering 
set number
" Copy to system clipboard
set clipboard=unnamedplus

set mousemodel=extend
set mouse=a

"set nobackup
"set nowritebackup
set noswapfile

set winaltkeys=no
"Always show current position
"set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Disable '--INSERT--' in statusline
set noshowmode
set showmatch 
set hlsearch
set incsearch
" Ingnore case in find
set ignorecase

set tw=79
set smarttab
set complete-=i

colorscheme monokai
set termguicolors
set t_Co=256


" Conceal for monokai
hi clear Conceal
hi Conceal guifg='#8EC9F2'



" Tab size
set tabstop=4
" Converting tabs to spaces
set expandtab
" Newline tab size
set shiftwidth=4
" Line break instead word wrap 
set wrap linebreak nolist
" Split window settings
set splitbelow
set splitright

"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
"------------------------------
" 3.1. Statusbar settings
"------------------------------
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ \ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"------------------------------
" 3.2. GUI settings           
"------------------------------
"set notermguicolors
if has("gui_running")
    " Remove toolbar
    set guioptions-=T
    " Remove menu bar
    set guioptions-=m 
    " Remove right-hand scroll bar
    set guioptions-=r  
    set guioptions-=L
    set guiheadroom=0
    set guioptions-=e
endif
"------------------------------
" 3.3. Session Settings       
"------------------------------
"let g:session_default_to_last   = 1
"let g:session_autoload          = 'no'
"let g:session_autosave          = 'yes'
"" Autosave period in minutes 
"let g:session_autosave_periodic = 1
"let g:session_autosave_silent   = 1
set sessionoptions-=buffers
set sessionoptions-=help
set sessionoptions-=options
"------------------------------
" 3.3. Autocmd Settings       
"------------------------------
autocmd! BufWritePost .vimrc  source %
autocmd! BufEnter      *      call system("echo ". expand("%:p:h") ."> ~/.last_dir")
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" |  endif
"------------------------------------------------------------
"4. Map definitions (Key bindings)                                   
"------------------------------------------------------------
"nnoremap <silent> <esc> :nohlsearch <CR>
"map <silent> <esc> :let @/=''<CR>
" Copy to system clipboard
"noremap <leader>y "*y
"noremap <leader>p "*p
"noremap <leader>Y "+y
"noremap <leader>P "+p
"Delete without copy
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
"Delete with copy (cut)
nnoremap <leader>x "_x
vnoremap d "_d
nnoremap <leader>d "_d
nnoremap <leader>D "_D

"cno $h e ~/ 
"cno $d e ~/Desktop/
"cno $j e ./
"cno $c e <C-\>eCurrentFileDir("e")<cr>
"cno $q <C-\>eDeleteTillSlash()<cr>



" Move a line of text using Ctrl+[jk] 
nmap <C-j> mz:m+<CR>`z
nmap <C-k> mz:m-2<CR>`z
vmap <C-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>`>my`<mzgv`yo`z

nnoremap <silent> <C-o> :RangerCurrentDirectory <CR>
nnoremap <silent> <esc><esc> :silent! nohlsearch <CR>

"Save with root
command! W  execute 'w !sudo tee % > /dev/null' <bar> edit!

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"------------------------------------------------------------

if has('win32')
    set guifont=Consolas:h13:cANSI
elseif has('unix')
    set guifont=Monospace\ 12
endif

"------------------------------------------------------------
" Шпаргака по горячим клавишам
"------------------------------------------------------------
"
"------------------------------
" Способы перейти в режим вставки
"------------------------------

"
" <i> - вставить текст слева от текущего
" <I> - вставить текст в начало строки
" <a> - вставить текст справа от текущего символа
" <A> - вставить текст в конец текущей строки
" <o> - создать новую строку под текущей
" <O> - создать новую строку над текущей
" <C> - заменить всё до конца строки
" <r> - заменить 1 символ
" <ciw> - заменить слово под курсором
" <ci"> - заменить текст между кавычками
" <ci(> - заменить текст между круглыми скобками
" <gi> - перейти к последнему месту, где производилось редактирование
"
"------------------------------
" Передвижение по тексту
"------------------------------
" <fx> - передвинуть курсор вперед к следующему вхождению 
"        символа 'x' в текущей строке
" <tx> - передвинуть курсор вперед к следующему вхождению 
"        символа 'x' в текущей строке
"        и установить курсор перед символом 'x'
" <Fx> - передвинуть курсор назад к предыдущему вхождению 
"        символа 'x' в текущей строке
" <w> - передвинуть курсор на одно слово вперед
" <b> - передвинуть курсор на одно слово назад 
" <0> - передвинуть курсор на начало текущей строки 
" <^> - передвинуть курсор на первый символ в текущей строке
" <$> - передвинуть курсор на конец текущей строки
" <*> - начать поиск по слову под курсором
" <#> - начать поиск по слову под курсором в обратном порядке
" <%> - перейти к закрывающейся парной скобке
"
"------------------------------
"Выделение текста
"------------------------------
" <v%> - когда курсор установлен на одной из скобок - выделит всё до её пары.
" <vib> - выделить всё между двумя ближайшими к курсору круглыми скобками
" <viB> - выделить всё между двумя ближайшими к курсору фигурными скобками
" <vi"> - выделить всё между двумя ближайшими двойными кавычками
" <vi'> - выделить всё между двумя ближайшими одинарными кавычками
" <ggVG> - выделить весь файл
" <Ctrl+v> - выделять прямоугольником
"
"------------------------------
"Прочее
"------------------------------
" <cw()<ESC>P> - заключить одно слово в скобки
" <gq> - в Visual-mode  переформатирует строку
" <Ctrl+a> - увеличить число под курсором на 1
" <Ctrl+x> - уменьшить число под курсором на 1
" <~> - изменить регистр символа на противоположный
" <J> - объединить текущую строку со следующей
