if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
set backspace=indent,eol,start
" basic
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

" window
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
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" dein
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('tpope/vim-endwise')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('w0rp/ale')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('lighttiger2505/gtags.vim')
call dein#add('thinca/vim-qfreplace')
call dein#add('jsfaint/gen_tags.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tpope/vim-rails')
call dein#add('zchee/deoplete-jedi')
call dein#add('osyo-manga/vim-monster')
call dein#add('cohama/lexima.vim')
call dein#end()


if dein#check_install()
  call dein#install()
endif

" denite configure ref: http://replicity.hateblo.jp/entry/2017/06/03/140731
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'default_opts',['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" denite display
call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'direction', 'top')

" denite mapping
call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
call denite#custom#map('normal', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-J>', '<denite:assign_next_text>')
call denite#custom#map('insert', '<C-K>', '<denite:assign_previous_text>')
call denite#custom#map('insert', '<C-S>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-V>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-O>', '<denite:do_action:tabopen>')
noremap <C-G> :Denite grep<CR>
noremap <C-P> :Denite buffer<CR>
noremap <C-N> :Denite -buffer-name=file file<CR>
noremap <C-Z> :Denite file_old<CR>
noremap <C-C> :Denite file_rec<CR>
nnoremap sB :<C-u>Denite buffer -buffer-name=file<CR>
nnoremap <silent> <Leader><C-f> :<C-u>Denite line<CR>
nnoremap <silent> <expr><Space>l ":<C-u>DeniteWithCursorWord line<CR>"

" NEEDTREE
nnoremap <silent><C-e> :NERDTreeToggle<CR>
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

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" get_tags
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

" ALE
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1

let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" enable linter
let g:ale_linters = {
\   'python': ['flake8'],
\   'ruby': ['ruby', 'rubocop'],
\   'javascript': ['eslint'],
\}

nmap [ale] <Nop>
map <C-k> [ale]
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

" gtags
let g:Gtags_Auto_Map = 0
let g:Gtags_OpenQuickfixWindow = 1

" indent_guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238
hi LineNr ctermbg=240 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0

" deoplete-jedi
let g:deoplete#sources#jedi#python_path = '~/.pyenv/shims/python'

" vim-monster
let g:monster#completion#backend = 'solargraph'
let g:monster#completion#rcodetools#backend = "async_rct_complete"
" Or let g:monster#completion#solargraph#backend = "async_solargraph_suggest"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
