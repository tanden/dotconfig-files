""""""""""""""""
""dein Scripts""
""""""""""""""""
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/SumitaTakaki/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/SumitaTakaki/.cache/dein')
  call dein#begin('/Users/SumitaTakaki/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/SumitaTakaki/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('fatih/vim-go')
  call dein#add('scrooloose/syntastic')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"""""""""""""""""""
""Plugin Settings""
"""""""""""""""""""
""NERDTreeSettings""
function! ToggleNERDTree()
  let current = expand('%:p')
    execute printf(':NERDTreeToggle %s', current)
endfunction

""cnoremap <C-n> NERDTreeToggle""
noremap <C-c> :call ToggleNERDTree()<CR>

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""toggle NERDTree display""
let NERDTreeShowHidden = 1            "show dotfiles on NERDTree
let NERDTreeIgnore=[ '^\.', '\~$', '\.py[oc]$', '^\.DS_Store$', '^\.git$', '^\.hg$', '^\.svn$']
let g:NERDChristmasTree=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMouseMode=3
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

""nerdtree-tabs""
let g:nerdtree_tabs_open_on_console_startup=1

""vim-go""
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
""vim-goの設定ではないけど""
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/


""""""""""""
""基本設定""
""""""""""""
" 文字コード
set encoding=utf-8
set fileencoding=utf-8

" 改行コードの自動認識
set fileformats=unix,dos,mac

" ビープ音を鳴らさないにする
set vb t_vb=


""""""""""""""
""インデント""
""""""""""""""
" 1つのTABに対応する空白の数
set tabstop=4
set softtabstop=4

" インデント一つに使われる空白の数
set shiftwidth=4

" タブを挿入する時、代わりに空白を使わない
set noexpandtab



""""""""
""表示""
""""""""
" 行番号
set number

" ルーラー
set ruler

" 入力中のコマンドをステータスに表示するように
set showcmd

" ステータスラインを常に表示
set laststatus=2

" 括弧入力時の対応する括弧を表示
set showmatch

" シンタックスハイライトを有効にする
syntax on

" 検索結果文字列のハイライトを有効にする
set hlsearch

" コメントの色を変更
highlight Comment ctermfg=DarkCyan

" コマンドライン補完拡張モードにする
set wildmenu

" 勝手に改行するのを無効にする
set textwidth=0

" ウィンドウの幅より長い行は折り返して次の行に表示する
set wrap

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>

" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white


""""""""""""""""""""
""バックアップ設定""
""""""""""""""""""""
" バックスペースキーで削除できるものを指定
set backspace=indent,eol,start

" バックアップしない
set nobackup

" ファイルの上書きではバックアップする
set writebackup

" スワップファイルのディレクトリ指定
set directory=~/.vim/swap


""""""""
""検索""
""""""""
" コマンド検索パタン100個まで   
set history=100

" 検索時に大文字小文字を区別しない
set ignorecase

set wrapscan

set noincsearch


""""""""""
""その他""
""""""""""
" バッファを切り替えてもundoの効力を失わない
set hidden

" 起動時のメッセージを表示しない
set shortmess+=I
