"""""""""""""""""""""
" Vundle Configure  "
"""""""""""""""""""""
set nocompatible        " be iMproved, required                                                                        
filetype off            " Vundle required
set rtp+=~/.vim/bundle/Vundle.vim
						" set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
						" let Vundle manage Vundle, required


"""""""""""""""""""""
" Plugins list here "
"""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'The-NERD-Commenter'
Plugin 'taglist.vim'
Plugin 'a.vim'
Plugin 'c.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""
" let configure here "
""""""""""""""""""""""
let mapleader=','		" 设置快捷键前缀
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
						" 添加ycm的配置路径 required
let NERDTreeShowBookmarks=1 			" 自动打开书签
let Tlist_Exit_OnlyWindow=1			" 如果仅剩taglist窗口打开，:q时直接退出vim
let Tlist_Use_Right_Window=1			" Tlist列表放在右侧
let Tlist_WinWidth=25				" Tlist列表宽度
let Tlist_Show_One_File=1			" 仅显示一个文件的tag列表


""""""""""""""""""""""
" set configure here "
""""""""""""""""""""""
colorscheme desert
syntax on               " 自动语法高亮
set number		" 行号
set numberwidth=1	" 行号缩进
set shiftwidth=4        " 代码自动缩进长度
set showmatch		" 显示括号匹配（光标会回溯到前者）
set ruler               " 右下角光标位置显示
set cursorline          " 当前行下划线显示
set incsearch		" 输入搜索内容时就显示搜索结果
set hlsearch 		" 搜索时高亮显示被找到的文本
set nowrapscan		" 禁止在搜索到文件两端时重新搜索
set ignorecase smartcase
			" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set laststatus=2	" 显示状态行
set statusline=set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
			" 设置在状态栏显示的信息
set mouse=a 		" 开启鼠标支持
set tags+=/usr/include/tags
						" taglist configure
set foldenable          " 开启折叠
set foldmethod=manual   " manual : Folds are created manually.
                        " indent : Lines with equal indent form a fold.
                        " expr   : ‘foldexpr’ gives the fold level of a line.
                        " marker : Markers are used to specify folds.
                        " syntax : Syntax highlighting items specify folds.
                        " diff   : Fold text that is not changed.
                        " command(eg):
                        "      zf%   create a fold code block with {}<>[]
                        "      zo    open
                        "      zc    close
                        "      space open


""""""""""""""""""""""
" map configure here "
""""""""""""""""""""""
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
inoremap jkl <esc>		
						" insert模式： jkl 退回到normal模式
iabbrev mailrjx renzhexigua@163.com
						" 缩写自动补全
nnoremap <space> viw	
						" visual模式： 空格方式选中单词
vnoremap <c-u> <s-~> 	
						" visual模式： Ctrl-u对选中的单词替换大小写
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
						" normal模式： ,ev 打开vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>
						" normal模式： ,sv 立即重新读取vimrc配置
nnoremap <Leader>f :NERDTreeToggle<CR>
						" normal模式： ,f 打开/关闭nerdtree
nnoremap <Leader>t :Tlist<CR>
						" normal模式： ,t 打开/关闭taglist窗口
inoremap <Leader>' viw<esc>a'<esc>hbi'<esc>lela
						" insert模式： ,' 给所在的单词添加单引号
nnoremap <Leader><F12> :!ctags -R --c-kinds=+p --fields=+ias --extra=+q -I<CR>
						"


""""""""""""""""""""""
" autocmd configure  "
"""""""""""""""""""""" 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
						" 当vim不指定文件打开时，自动开启nerdtree目录树(2 lines directive)
autocmd FileType python  :iabbrev <buffer> iff if:<left>
						" insert模式： 编辑py文件iff缩写
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
						" 如果仅剩nerdtree窗口打开，:q时直接退出vim
