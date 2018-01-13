" package
if &compatible
  set nocompatible
endif

" Required:
set runtimepath^=/Users/kimuray/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/kimuray/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Shougo/unite.vim'
NeoBundle "kana/vim-submode"
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'szw/vim-tags'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'othree/yajs.vim'
NeoBundle 'maxmellon/vim-jsx-pretty'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'thinca/vim-ref'
NeoBundle 'basyura/unite-rails'
NeoBundle 'closetag.vim'

" optional
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/es.next.syntax.vim'
" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
"NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
"  \ 'insert' : 1,
"  \ 'filetypes': 'ruby',
"  \ }}

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['AlpacaTagsUpdate', 'AlpacaTagsSet', 'AlpacaTagsBundle']
      \ }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec/"

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------e

" Git mark
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:lightline = {
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction


" 色設定
:syntax on
autocmd ColorScheme * highlight LineNr ctermfg=252
set background=dark
colorscheme hybrid

" 基本設定
set encoding=utf-8
set clipboard+=unnamed
set number
set ruler
set cursorline
set laststatus=2
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set tabstop=2
set expandtab
set smartindent
set nrformats-=octal
set hidden
set virtualedit=block
set shiftwidth=2
set autoindent
set guifont=Ricty\ for\ Powerline:h18

autocmd BufNewFile,BufRead *.vue set filetype=html

" key mapping
" tabページ, windowのkeymap
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
" ブラウザリロード
let g:returnApp = "iTerm"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>bo :OperaReloadStart<CR>
nmap <Space>bO :OperaReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" Unite設定
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case  = 1
let g:unite_enable_smart_case   = 1
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite-rails
noremap :rc :<C-u>Unite rails/controller<CR>
noremap :rm :<C-u>Unite rails/model<CR>
noremap :rv :<C-u>Unite rails/view<CR>
noremap :rh :<C-u>Unite rails/helper<CR>
noremap :rs :<C-u>Unite rails/stylesheet<CR>
noremap :rj :<C-u>Unite rails/javascript<CR>
noremap :rr :<C-u>Unite rails/route<CR>
noremap :rg :<C-u>Unite rails/gemfile<CR>
noremap :rt :<C-u>Unite rails/spec<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" grep設定
nnoremap <expr> gr ':Rgrep<CR>'
let Grep_Skip_Dirs = '.svn .git'  "無視するディレクトリ
let Grep_Default_Options = '-I'   "バイナルファイルがgrepしない
let Grep_Skip_Files = '*.bak *~'  "バックアップファイルを無視する
if executable('jvgrep')
  set grepprg=jvgrep
endif

" ctags設定
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=.tags
set tags+=.Gemfile.lock.tags

" alpacatags
augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost Gemfile AlpacaTagsBundle
    autocmd BufEnter * AlpacaTagsSet
    " 毎回保存と同時更新する場合はコメントを外す
    " autocmd BufWritePost * TagsUpdate
  endif
augroup END

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

" ref.vim
let g:ref_open = 'vsplit'
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe'
let g:ref_refe_version = 2

nnoremap ,rr :<C-U>Ref refe<Space>

" close tag
inoremap <C-]> <C-R>=GetCloseTag()<CR><ESC>F<i
map <C-]> a<C-]><ESC>
