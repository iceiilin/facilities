
" -----------------------------------
" Vundle Setting
" -----------------------------------
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'moll/vim-node'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'xolox/vim-misc'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required*/*/

" ---------------------------------------
" General Configuration
" ---------------------------------------
set autoindent
syntax on
set nowrap
set smartindent
set tabstop=4
set softtabstop=4
set number
set nobackup
set hlsearch
set expandtab
set smarttab
set shiftwidth=4

" --------------------------------------
" Color & Font
" --------------------------------------
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set t_Co=256

" --------------------------------------
" Max length config
" --------------------------------------
highlight ColorColumn ctermbg=256 guibg=#2d2d2d

autocmd BufEnter *.py,*.js,*.json,*.sh,*.c,*.h,*.java,.vimrc,vimrc,_vimrc
            \ exec ":call AutoSetFileLineLimit()"

function! AutoSetFileLineLimit()
    let &colorcolumn=join(range(100,100),",")
endfunc

" ---------------------------------------
" Plugin neocompcache
" ---------------------------------------
let g:neocomplcache_enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ---------------------------------------
" Plugin syntastic
" ---------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map ,sn :lnext<CR>
map ,sp :lprevious<CR>}

" -------------------------------------
" Plugin: nerdcommenter
" -------------------------------------
map ,c<space> <leader>c<space>


" -------------------------------------
" Plugin: vim-colorscheme-switcher
" ------------------------------------
" F8 is used to switch color scheme by default
let g:colorscheme_switcher_define_mappings = 1

" -------------------------------------
" Plugin: nerdtree
" ------------------------------------
" ctrl+n to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '.'
let g:NERDTreeDirArrowCollapsible = '.'
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" -------------------------------------
" set vim color scheme in tmux
" ------------------------------------
if exists('$TMUX')
    set term=screen-256color
endif

" -------------------------------------
" Plugin: vim-indent-guides
" ------------------------------------
let g:indent_guies_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black

