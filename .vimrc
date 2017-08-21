
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

"Plugin 'bufexplorer.zip'
" Plugin 'Lokaltog/powerline'
Plugin 'moll/vim-node'
"Plugin 'walm/jshint.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
"Plugin 'bling/vim-airline'
Plugin 'marijnh/tern_for_vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'elzr/vim-json'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'hallettj/jslint.vim'
" Add support for reactjs
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'
" Add support for reactjs
Plugin 'posva/vim-vue'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required*/*/

set tags=tags;/
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

"---------------------------------------
" File encoding
"---------------------------------------
set fileencodings=utf-8,gbk,utf-16,big5,latin1
set fileencoding=utf-8
set encoding=utf-8
set termencoding=gbk

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
"highlight Normal ctermfg=grey ctermbg=base03

highlight ColorColumn ctermbg=256 guibg=#2d2d2d

autocmd BufEnter *.py,*.js,*.json,*.sh,*.c,*.h,*.java,.vimrc,vimrc,_vimrc
            \ exec ":call AutoSetFileLineLimit()"

function! AutoSetFileLineLimit()
    let &colorcolumn=join(range(100,100),",")
endfunc

"
" --------------------------------------
" Inband hoy key
" --------------------------------------
set pastetoggle=<F10>

" --------------------------------------
" Buffer switch
" --------------------------------------
"map gn :bn<cr>
"map gp :bp<cr>
"map gd :bd<cr>

" -------------------------------------
" Plugin: powerline
" ------------------------------------
"set t_Co=256
"set laststatus=2
"set background=dark
"let g:Powerline_symbols = 'fancy'

" -------------------------------------
" Plugin: YouCompleteMe
" -------------------------------------
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>

" ----------------------------------------
" My JSON Format (no plugin installed)
" ----------------------------------------
nmap <C-J> :%!python -m json.tool<CR>:setfiletype json<CR>

" ----------------------------------------
" => Plugin: Syntastic
" ----------------------------------------
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = "-c ~/.jshintrc"

let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "-c ~/.pylintrc"

let g:syntastic_sh_checkers = ['bashate']

let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_html_checkers = ['jshint', 'w3']
" let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_vim_checkers = ['vimlint']
let g:syntastic_xml_checkers = ['xmllint']
let g:syntastic_yaml_checkers = ['jsyaml']

 "set statusline+=%#warningmsg#
 "set statusline+=%{SyntasticStatuslineFlag()}
 "set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 1

" Manually do syntastic check
noremap <F5> :SyntasticCheck<CR>:Errors<CR>

" Close the error list
noremap <F6> ::SyntasticReset<CR>

noremap <leader>sn :lnext<CR>
noremap <leader>sp :lprevious<CR>}

" -------------------------------------
" Plugin: nerdcommenter
" -------------------------------------
map ,c<space> <leader>c<space>

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
" Plugin: vim-colorscheme-switcher
" ------------------------------------
" F8 is used to switch color scheme by default
let g:colorscheme_switcher_define_mappings = 1

" -------------------------------------
" Plugin: ag
" ------------------------------------
" let g:ag_working_path_mode="r"
" ctrl+g to toggle nerd tree
map <C-h> :Ag --ignore-dir node_modules/

" -------------------------------------
" Plugin: vim-indent-guides
" ------------------------------------
"colorscheme railscasts
"set ts=4 sw=4 et
let g:indent_guies_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey   ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

" -------------------------------------
" set vim color scheme in tmux
" ------------------------------------
if exists('$TMUX')
    set term=screen-256color
endif
