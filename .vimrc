set nocompatible " 关闭 vi 兼容模式
syntax on " 自动语法高亮
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >>
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on " 开启插件
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set foldenable " 开始折叠
" set foldmethod=syntax " 设置语法折叠
set foldmethod=indent
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:jsx_ext_required = 0

function! MySys()
  if has("win16") || has("win32") || has("win64") || has("win95")
    return "windows"
  elseif has("unix")
    return "linux"
  endif
endfunction

if MySys() == "windows"
  let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
  let $VIMFILES = $HOME.'/.vim'
endif

let helptags=$VIMFILES.'/doc'


if has("win32")
  set guifont=Inconsolata:h12:cANSI
endif

if has("multi_byte")

  set encoding=utf-8
  set termencoding=utf-8
  set formatoptions+=mM
  set fencs=utf-8,gbk

  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif

  if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif  

nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=jsx<CR>
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>

let html_use_css=1

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>


let b:javascript_fold=1

let javascript_enable_domhtmlcss=1

autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
autocmd filetype jsx set dictionary=$VIMFILES/dict/jsx.dict

" ++++=======代码格式化==========
autocmd FileType javascript noremap <buffer> <leader>f :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <leader>f :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <leader>f :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>f :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>f :call CSSBeautify()<cr>

if MySys() == "windows" " 设定windows系统中ctags程序的位置
  let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux" " 设定windows系统中ctags程序的位置
  let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1

" :NERDTree设置区
"map <F3> :NERDTreeToggle<CR>
map <Leader>] :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看

let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a <LEFT><LEFT><LEFT>

let g:checksyntax_auto = 0 " 不自动检查

let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

au VimEnter * NERDTree
call plug#begin('~/.vim/plugged')
Plug 'pearofducks/ansible-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'suan/vim-instant-markdown'
Plug 'christoomey/vim-run-interactive'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'
Plug 'isRuslan/vim-es6'
Plug 'heavenshell/vim-jsdoc'
Plug 'scrooloose/nerdcommenter'
" Plug 'Valloric/YouCompleteMe'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv/'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'chemzqm/wxapp.vim'
Plug 'neoclide/coc.nvim'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ianks/vim-tsx'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'mattn/emmet-vim'
Plug 'zivyangll/git-blame.vim'
" Plug 'scrooloose/syntastic'
" Plug 'Chiel92/vim-autoformat'
call plug#end()

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>
nnoremap <Leader><Leader> :!
" 自定义命令区 ++++++++++++++
" nnoremap qq :q<CR>
" nnoremap qf :q!<CR>
" nnoremap qw :wq<CR>
nnoremap <Leader>[ :tab
" map f, :tabp<CR>
" map f. :tabn<CR>
map fa gg<s-v><s-g>
map fj 10j
map fh 10h
map fk 10k
map fl 10l
map gj 5j
map gh 5h
map gk 5k
map gl 5l
map fq :q<CR>
map fw :w<CR>
map fx :x<CR>
map f4 :set tabstop=4 shiftwidth=4 softtabstop=4<CR>
map f2 :set tabstop=2 shiftwidth=2 softtabstop=2<CR>
map fc <Leader>c<space>
map <Leader>cl :tabc<CR>
map <Leader>op :tabo<CR>
map fe @e

" =+++++++++++++++++++++++++++
" 默认不折叠
"set foldenable
" Add syntax rule
let g:markdown_quote_syntax_filetypes = {
        \ "css" : {
        \   "start" : "\\%(css\\|scss\\)",
        \},
  \}

" 'start' and 'end' is vim regular expression.
" need to care backslash.

" Add other file types in which quote syntax should be on.
let g:markdown_quote_syntax_on_filetypes = ['text']

" 自定义注释
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'vue': { 'left': '//','leftAlt': '<!--','rightAlt': '-->' } }
let g:NERDDefaultAlign = 'left'
let g:NERDToggleCheckAllLines = 1

" 显示隐藏文件
let NERDTreeShowHidden=1

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_always_populate_loc_list = 1
" let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
" let g:formatters_javascript = ['eslint']

" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
"set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
" set textwidth=80
set textwidth=8000
set colorcolumn=+1
" Numbers
set number
set numberwidth=5

set matchpairs+=<:>
set hlsearch

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
hi CursorLine term=bold,reverse cterm=bold,reverse gui=bold,reverse guifg=#455354 guibg=fg
hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

colorscheme molokai
set t_Co=256
set background=dark

function! Csp(t)
  if a:t == "up" 
    set nosplitbelow
    :split
  elseif a:t == "dw"
    set splitbelow
    :split
  elseif a:t == "lf"
    set nosplitright
    :vsplit
  elseif a:t == "rg"
    set splitright
    :vsplit
  else
    set splitbelow
    :split
  endif
endfunction
function! CResize(num)
  let total = 5
  let ind = 0
  if a:num > 0
    let total = a:num
    while ind < total
      :res +1
      let ind = ind - 1
    endwhile
  elseif a:num < 0
    while ind > total
      :res -1
      let ind = ind + 1
    endwhile
  endif
endfunction

" 所有自定义vim命令都由U头


" 分屏, 默认下面
command! Usp :execute Csp("")
" 上面
command! Usu :execute Csp("up")
" 下面
command! Usd :execute Csp("dw")
" 左边
command! Usl :execute Csp("lf")
" 右边
command! Usr :execute Csp("rg")

map mj :res +5<CR>
map mk :res -5<CR>
map ml :vertical resize+5<CR>
map mh :vertical resize-5<CR>

map mv <C-w>t<C-w>H
map mh <C-w>t<C-w>K
"emmet config
let g:user_emmet_leader_key='<c-f>'

"vue config
iab vall <template lang="pug"><CR><TAB><CR></template><CR><script><CR><TAB><CR></script><CR><style lang="less"><CR><CR></style><ESC>gg
iab vtemplate <template lang="pug"><CR><TAB><CR></template><ESC>kk
iab vscript <script><CR><TAB><CR></script><ESC>kk
iab vstyle <style lang="less"><CR><CR></style><ESC>kk
iab vnew export default {<CR><TAB>name: ""<CR>}<ESC>kk
"
"
" autoload _vimrc
autocmd! bufwritepost ~/.vimrc source %
