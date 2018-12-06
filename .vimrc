set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Shougo/vimproc.vim'
Plugin 'shougo/vimshell'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bronson/vim-trailing-whitespace'
"Plugin 'Shougo/neocomplcache'
"Plugin 'Shougo/neocomplete.vim'

call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く
"indent
set background=dark
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

"neocomplcache

"by myself
colorscheme default
set encoding=utf-8
scriptencoding utf-8
syntax on
hi Comment ctermfg=green
"set number
set term=xterm-256color
nnoremap <CR> i<CR><ESC>
nnoremap <Space> i<Space><ESC>l
nnoremap <c-a> <c-a>gv
nnoremap <c-x> <c-x>gv

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
 nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
 set showmatch " 括弧の対応関係を一瞬表示する
" source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
