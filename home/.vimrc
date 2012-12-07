:set enc=utf-8
:set fenc=utf-8
:set fencs=iso-2022-jp,enc-jp,cp932
:set number
:set tabstop=4
set list
set listchars=tab:^\ ,trail:~
:set autoindent
:set expandtab
:set ignorecase
:set shiftwidth=4
:set showmatch
":set syntax on
highlight TabSpace ctermbg=gray
"highlight TabSpace ctermbg=#C0C0C0
"highlight TabSpace ctermfg=#ffffff guifg=#000000 guibg=#C0C0C0 cterm=none gui=none
match TabSpace /\t\|\s\+$/
syntax on


" Execute python script C-P 
function! s:ExecPy()
    exe "!" . &ft . " %"
        :endfunction
            command! Exec call <SID>ExecPy()
                autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

" python
filetype plugin on
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp
set encoding=utf-8

" 削除でレジスタに格納しない
nnoremap x "_x
nnoremap dd "_dd
"
" クリップボードとyankを共通化 macだと効かないようだ
set clipboard+=unnamed

"
" 検索結果をハイライト
set hlsearch

colorscheme desert

filetype plugin indent on
"source /usr/share/vim/vim72/syntax/php.vim
"source /Users/oriori/.vim/scala-tool-support/vim/syntax/scala.vim
"source /Users/oriori/.vim/cocoa.vim
"source /Users/oriori/.vim/plugin/cocoa.vim

" beep音を消します
set visualbell
set vb t_vb=


"netrwの設定
" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1


map <C-g> :Gtags 
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
nmap <F3> :GtagsCursor<CR>
map <F4> :wincmd gF<CR>


set nocompatible
filetype off                   " (1)

set rtp+=~/.vim/vundle.git/    " (2)
call vundle#rc()               " (3)

" original repos on github
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
"
" " vim-scripts repos
" Bundle 'rails.vim'
"
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"
 filetype plugin indent on     " (5)

let g:neocomplcache_enable_at_startup = 1

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
