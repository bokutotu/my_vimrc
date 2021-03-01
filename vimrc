" color tema for vim
colorscheme molokai

" 行番号を表示する
set number

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

" インデントを良い感じにする
" set autoindent
set tabstop=4
" JS or HTMLの時だけTab幅を変える
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
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

call plug#begin('~/.vim/plugged')

    " 括弧補完
    Plug 'cohama/lexima.vim'
    
    " language serverのやつ
    Plug 'rust-lang/rust.vim'

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
    " Plug 'taichouchou2/html5.vim'
    Plug 'kchmck/vim-coffee-script'
    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Or build from source code by using yarn: https://yarnpkg.com
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    " 補完
    function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
    endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

let python_highlight_all=1

" emmet
let g:user_emmet_leader_key='<c-t>'

" YCM


set completeopt-=preview

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
inoremap <leader>; <C-x><C-o>

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" }}}

" 見た目系

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

" 記号をつけてかっこよくする
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set guifont=Source\ Code\ Pro\ for\ Powerline:h15:cANSI
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)

" " unicode symbols
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" タブの切り替え
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" rust
let g:rust_clip_command = 'xclip -selection clipboard'
" for mac
" let g:rust_clip_command = 'pbcopy'

" いまいる場所を強調
" 行を強調表示
set cursorline

" 列を強調表示
set cursorcolumn

" jjでescになる
inoremap <silent> jj <ESC>


" HTML
augroup HTMLANDXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
