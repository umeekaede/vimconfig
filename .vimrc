set formatoptions-=ro
set nocompatible
""" Save fold settings.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'Shougo/deoplete.nvim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neocomplete'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Shougo/vimproc.vim'
Plugin 'shougo/vimshell'
Plugin 'vim-airline/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'scrooloose/nerdtree'
Plugin 'kana/vim-submode'
Plugin 'kassio/neoterm'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'vim-scripts/vim-auto-save'
"Plugin 'cohama/lexima.vim'

Plugin 'dhruvasagar/vim-table-mode'
call vundle#end()
filetype plugin indent on

let g:table_mode_corner="|"

"　その他のカスタム設定を以下に書く
"indent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=gray
let g:indent_guides_color_change_percent = 20
let g:indent_guides_guide_size = 1

" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}


"by myself
set encoding=utf-8
scriptencoding utf-8
syntax enable
hi Comment ctermfg=green
"set number
nnoremap <CR> i<CR><ESC>
nnoremap <Space> i<Space><ESC>l
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set shiftwidth=2 " smartindentで増減する幅
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
hi Search ctermbg=Cyan
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
hi Search ctermbg=Red
hi Search ctermfg=Black

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
set showmatch " 括弧の対応関係を一瞬表示する
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"neosnippet
"" neosnippet
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
" 自分用 snippet ファイルの場所
let s:my_snippet = '~/.vim/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet
""起動時に有効
let g:neocomplete#enable_at_startup = 1
"" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 100
""キーワードの長さ、デフォルトで80
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1

" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 2
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 2

inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/neoterm'

filetype plugin on
nnoremap <c-t><c-t> :Ttoggle<CR>
tnoremap <c-t><c-t> <C-\><C-n>:Ttoggle<CR>
nnoremap (keymapping) :T (command)<CR>
nnoremap (keymapping) :T (command)<CR><C-w>j


" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> <c-n> :tablast <bar> tabnew<CR>
" close tab
map <silent> <c-_> :tabclose<CR>
map <silent> [Tag]x :tabclose<CR>

" jump to before tab
map <silent> <c-k> :tabnext<CR>
" jump to before tab
map <silent> <c-j> :tabprevious<CR>

"カーソルを行頭，行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

let g:neoterm_default_mod = 'split'
let g:neoterm_size = 20
"set termwinsize=8x0
"set clipboard=unnamed,autoselect
" Don't save options.
set viewoptions-=options
set number
set cursorline
let g:vim_markdown_conceal = 0

"let g:auto_save=1
"let g:auto_save_in_insert_mode=0
set termwinsize=8x0
set splitbelow
set mouse=a
set ttymouse=xterm2
"set background=light
"colorscheme molokai
"colorscheme solarized
set term=xterm-256color
syntax enable
"colorscheme solarized
"set background=dark
"highlight CursorLine ctermbg=Black
"
"hi Terminal ctermbg=black
"colorscheme hybrid

set clipboard=unnamed,autoselect
set hidden
autocmd QuickFixCmdPost *grep* cwindow
set tags=./tags;$HOME
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
