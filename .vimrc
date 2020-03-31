" Base Settings --------------- {{{ 
" Mouse and backspace
set mouse=a " on OSX press ALT and click

" 缩紧不整齐时候，输入>>可以纠正，
" 而不是在原来基础上再缩紧 
set shiftround

" Userful settings
set history=700
set undolevels=700

set backspace=2


" 编码
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 开启语法高亮
syntax on
" 禁止光标闪烁
"set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=L
" 禁止显示菜单和工具栏
set guioptions-=m
set guioptions-=T
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 开启相对行号
set relativenumber

set colorcolumn=80
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 禁止折行
"set nowrap

" 打开文件类型检测功能
filetype on
" 允许vim加载文件类型插件
filetype plugin on
" 允许vim为不同类型的文件定义不同的缩进格式
filetype indent on
" 三种缩进模式cindent, smartindent, autoindent
set smartindent

" 设置文件缩进
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格时
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" html/rb/css/js/coffeescript/jade/json files, 2spaces



" 基于缩进或者语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 高亮显示搜索结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" set backupdir=$VIM_TEMP,.
" set directory=$VIM_TEMP,.

" 总是显示状态栏
set laststatus=2
set t_Co=256

" vim 自身命令行模式智能补全
set wildmenu

" }}}

" Mappings ------------- {{{
" ==================
" =    快捷键区    =
" ==================
" 定义快捷键的前缀，既<Leader>
let mapleader=" "
let maplocalleader=","
" map sort function to a key
vnoremap <Leader>s :sort<CR>
" 水平打开~/.vimrc, 按ZZ保存并关闭
nnoremap <Leader>ev :split $MYVIMRC<cr>
" reload ~/.vimrc
nnoremap <Leader>sv :source $MYVIMRC<cr>
" abbreviations email
iabbrev @@ here.wait.go@gmail.com
" word -> \"word\"
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel
" word -> 'word'
nnoremap <Leader>' viw<esc>a'<esc>hbi'<esc>lel
" in visual mode, and selected, example abcd<selected>1234</selected>efg -> abcd\"1234\"efg
" another comment 
" vnoremap <Leader>" c""<esc>v
vnoremap <Leader>" <esc>`>a"<esc>`<i"<esc>
" map sort function to a key
vnoremap <Leader>s :sort<CR>
" 定义快捷键到行首和航尾
"nmap lb 0
"nmap ln $
" 设置折行功能
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"set clipboard=unnamedplus
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并推出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方窗口
nnoremap <Leader>jw <C-W>j
" 跳转至下方窗口
nnoremap <Leader>kw <C-W>k
" 定义快捷键在结对符之间跳转，助记pair
" nmap <Leader>pa %
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" easier moving of code blocks
vnoremap < <gv " better indentatition
vnoremap > >gv " better indentatition


" Operator-Pending映射
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
" }}}

" FileType-specific settings ----------- {{{
augroup init
    autocmd!
    " 让配置变更立即生效
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    " 输入切换到绝对行号
    "autocmd InsertEnter * :set number
    " 输入离开切换到相对行号
    "autocmd InsertLeave * :set relativenumber
    autocmd Filetype html,css,ruby,javascript,coffeescript,jade,json setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype java set tags=$JAVA_HOME/tags,./tags,tags;
    " c,cpp配置
    autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
augroup END

" Vimscript file settings ----------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"}}}


" Vundle Plugin Settings ------------- {{{
" 设置Vundle
" be iMproved, required
set nocompatible
" 关闭文件类型侦测
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 主题风格插件
Plugin 'tomasr/molokai'
" 状态栏插件
"Plugin 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'
" C++11/14 STL语法高亮插件
Plugin 'Mizuchi/STL-Syntax'

" 可视化缩进层次插件
Plugin 'nathanaelkane/vim-indent-guides'
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" c/c++接口与实现快速切换插件
Plugin 'vim-scripts/a.vim'
" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或者 *.h
nmap <Leader>sch :AS<CR>

" 标签可视化插件
Plugin 'kshenoy/vim-signature'
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "mda",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "mn",
    \ 'GotoPrevSpotByPos'  :  "mp",
    \ 'GotoNextMarker'     :  "[+",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListLocalMarks'     :  "ms",
    \ 'ListLocalMarkers'   :  "m?"
    \ }

" 自动生成标签并引入插件
" Plugin 'file:///~/.vim/bundle/indexer'
" indexer依赖的两个插件
Plugin 'DfrankUtil'
Plugin 'vimprj'
" 设置插件indexer调用 ctags 的参数
" 默认 -c++-kinds=-p-l，从新设置为-c++-kind=+c+d+e+f+g+l+m+n+p+s+t+u+v+x
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommondLineOptions="--c++-kinds=+c+d+e+f+g+l+m+n+p+s+t+u+v+x --fields=+iaSl --extra=+q"

"Plugin 'taglist.vim'
" 不同时显示多个文件的tag,只显示当前文件的
"let Tlist_Show_One_File=1 
" 如果taglist窗口是最后一个窗口,则退出vim
"let Tlist_Exit_OnlyWindow=1
" 在右侧出口中显示taglist窗口
"let Tlist_Use_Right_Window=1

Plugin 'majutsushi/tagbar'
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_right=1
" 设置显示/隐藏标签列表子窗口的快捷键。速记：tag list
nnoremap <Leader>tl :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }

" 工程文件浏览插件
Plugin 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>n :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 多文档编辑插件
Plugin 'fholgado/minibufexpl.vim'
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>

" quickfix 
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" nodejs
Plugin 'moll/vim-node'


Plugin 'mattn/emmet-vim'
Plugin 'walm/jshint.vim'
Plugin 'derekwyatt/vim-scala'
" Plugin 'ktvoelker/sbt-vim'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc,*.so,*.swp,*.zip
set wildignore+=*build/*,*/tmp/*,*/node_modules/*,*/target/*,*/dist/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

Plugin 'vim-scripts/JavaImp.vim--Lee'
let g:JavaImpPaths = $JAVA_HOME . "/src," .
\ "./app," . "./src" .
\ $ACTIVATOR_REPOSITORY
                
let g:JavaImpDataDir = $HOME . "/.vim/JavaImp"
"let g:JavaImpSortJavaFirst = 0
"let g:JavaImpSortBin = "sort"
"let g:JavaImpSortPkgSep = 1

Plugin 'rizzatti/dash.vim'
Plugin 'matchit.zip'
" 注释插件
Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-fugitive'

Plugin 'java_getset.vim'

" Track the engine.
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" let g:UltiSnipsUsePythonVersion = 3


Plugin 'BufOnly.vim'

" 成对生成(),{},[]
"Plugin 'Raimondi/delimitMate'

" 令 GVim 专属的配色方案应用于 Vim 终端
Plugin 'CSApprox'


" 参数折叠
Plugin 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>a :ArgWrap<CR>

Plugin 'Tabular'
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

Plugin 'aserebryakov/vim-todo-lists'

Plugin 'davidhalter/jedi-vim'
let g:jedi#force_py_version=2

call vundle#end()
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 配色方案
set background=dark
colorscheme molokai

" }}}


" Funcations Settings -------------- {{{

" functions
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" }}}
