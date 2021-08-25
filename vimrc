" 行番号を表示する
set number

" 1行あたり80文字超えたラインでハイライトする
set colorcolumn=80
highlight ColorColumn guibg=#202020 ctermbg=yellow

" 検索パターンが一致する時候補すべてハイライト
set hlsearch

" インデントが空白で行われる
set expandtab

" 検索する時大文字小文字区別しない
set ignorecase

" 検索途中でもハイライトされる
set incsearch

" 大文字を含む検索では大文字を無視しない
set smartcase

" ファイルのステータスが常に表示される
set laststatus=2

" よくわからん
set nocompatible

" シンタックスハイライトをon
syntax on

" xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x

" いまいる場所を強調
" 行を強調表示
set cursorline

" 列を強調表示
set cursorcolumn

" jjでescになる
inoremap <silent> jj <ESC>


" coc vim の設定
set nobackup
set nowritebackup

set cmdheight=2

set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" 画面分割系統
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l


" インデントを良い感じにする
" set autoindent
set tabstop=4
" JS or HTMLの時だけTab幅を変える
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.cu setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.c  setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.cpp  setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.json setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" set shiftwidth=4

" ESC 二回でハイライト削除
nnoremap <ESC><ESC> :nohlsearch<CR>

" swap fileを作らない
nnoremap <ESC><ESC> :nohlsearch<CR>

" いいかんじに挿入できるようにする
set completeopt=menuone,noinsert

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" C-nとC-pでどれを挿入するか選択する.
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

" ウィンドウ間を逆に移動
noremap  <A-k> <C-w>W
inoremap <A-k> <Esc><C-w>W
tnoremap <A-k> <C-\><C-n><C-w>W
" 他のウィンドウを閉じて最大化する
noremap  <A-o> <C-w>o
inoremap <A-o> <Esc><C-w>o
tnoremap <A-o> <C-\><C-n><C-w>o
" コマンドラインモードに移行（これは英語キーボードの場合です）
noremap  <A-;> :
inoremap <A-;> <Esc><C-o>:
tnoremap <A-;> <C-\><C-n><C-w>:
" 検索に移行
noremap  <A-/> /
inoremap <A-/> <Esc><C-o>/
tnoremap <A-/> <C-\><C-n>/

call plug#begin('~/.vim/plugged')
    Plug 'jacoborus/tender.vim'

    " 括弧補完
    Plug 'cohama/lexima.vim'
    
    Plug 'scrooloose/nerdtree'

    Plug 'tpope/vim-commentary'

    " 見た目系
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/landscape.vim'

    Plug 'rust-lang/rust.vim'

    Plug 'mattn/emmet-vim'
    Plug 'tyru/open-browser.vim'
    Plug 'mattn/webapi-vim'
    Plug 'tell-k/vim-browsereload-mac'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'kchmck/vim-coffee-script'

    " Or build from source code by using yarn: https://yarnpkg.com
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    Plug 'ctrlpvim/ctrlp.vim'


call plug#end()

" 見た目系
" color schrme

if (has("termguicolors"))
 set termguicolors
endif

" NERDTREE
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Theme
syntax enable
colorscheme tender

" set airline theme
let g:airline_theme = 'tender'

" set lighline theme inside lightline config
let g:lightline = { 'colorscheme': 'tender' }

let g:airline#extensions#tabline#enabled = 1


let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
    \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
    \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
    \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

" タブの切り替え
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" rust
let g:rust_clip_command = 'xclip -selection clipboard'
let g:rustfmt_autosave = 1
filetype plugin indent on

" for mac
" let g:rust_clip_command = 'pbcopy'


" HTML
augroup HTMLANDXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" tabnine
" set rtp+=~/tabnine-vim

" Coc vim
"LightLineにcoc.nvimのステータスを載せます
let g:lightline = {
  \'active': {
    \'right': [
      \['coc']
    \]
  \},
  \'component_function': {
    \'coc': 'coc#status'
  \}
\}

"Diagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

"以下ショートカット

"ノーマルモードで
"スペース2回でCocList
nmap <silent> <space><space> :<C-u>CocList<cr>
"スペースhでHover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <silent> <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <silent> <space>rf <Plug>(coc-references)
"スペースrnでRename
nmap <silent> <space>rn <Plug>(coc-rename)
"スペースfmtでFormat
nmap <silent> <space>fmt <Plug>(coc-format)

let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

