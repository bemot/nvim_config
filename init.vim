"

" version: 12.0.0

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal
" (if you aren't using one of those fonts, you will see funny characters here.
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 1
"bobik
let mapleader="\<Space>"
"end bobik
set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
 let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
silent !mkdir -p ~/.config/nvim/autoload
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the config down below
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use

call plug#begin("~/.config/nvim/plugged")

" Now the actual plugins:
"bobik normal mode in cyrillic
"Plug 'rtxanson/vim-cyrillic'
"fancy cow
Plug  'mhinz/vim-startify'
"bobik
"Php-vim
"Plug 'StanAngeloff/php.vim'
"Plug 'arnaud-lb/vim-php-namespace'
"vim surround and vim_close_tag
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
"snippets
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
" bobik
"python snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"tex edit
Plug 'lervag/vimtex'
"search and replace
Plug 'skwp/greplace.vim'
"end of bobik
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
Plug 'JuliaEditorSupport/julia-vim'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Better file browser
Plug 'scrooloose/nerdtree'
" Class/module browser
Plug 'majutsushi/tagbar'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" A couple of nice colorschemes
" Plug 'fisadev/fisa-vim-colorscheme'
Plug 'patstockwell/vim-monokai-tasty'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Async autocompletion
if using_neovim && vim_plug_just_installed
    Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
endif
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
" Surround
Plug 'tpope/vim-surround'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
Plug 'sheerun/vim-polyglot'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Window chooser
Plug 't9md/vim-choosewin'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
" Highlight matching html tags
Plug 'valloric/MatchTagAlways'
" Generate html in a simple way
Plug 'mattn/emmet-vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" Linters
Plug 'neomake/neomake'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
Plug 'myusuf3/numbers.vim'
" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'
"
"GraphQL plugin
Plug 'jparise/vim-graphql'
"
" bobik
"python snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" bobik
" install vim-rooter
Plug 'airblade/vim-rooter'
"
Plug 'tpope/vim-obsession'
Plug 'kien/tabman.vim'

" bobik mouse
set mouse=n

command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"

" Code searcher. If you enable it, you should also configure g:hound_base_url
" and g:hound_port, pointing to your hound instance
" Plug 'mattn/webapi-vim'
" Plug 'jfo/hound.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" set transparent background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
"bobik
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }
let g:python3_host_prog = '/home/sasha/pythonchik_NVIM/bin/python'
" for snipmate file
"

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\

" use 256 colors when possible
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme vim-monokai-tasty
else
    colorscheme delek
endif

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
" bobik
" set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings
map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1

let g:NERDSpaceDelims = 1

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction
nmap <leader>n :call ToggleNERDTree()<CR>
nmap <leader>q :qa!<CR>

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" Fzf ------------------------------

" file finder mapping
nmap <leader>e :Files<CR>
" tags (symbols) in current file finder mapping
nmap <leader>g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap <leader>G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap <leader>f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap <leader>F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap <leader>co :Commands<CR>

" general search Ag
nmap <leader>l :Ag<CR>
" general search Rg
nmap <leader>x :Rg<Cr>
" Deoplete -----------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#custom#option = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
nmap ,r :Ack
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>
"bobik
nnoremap <buffer> <F9> :w <bar> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <buffer> <F5> :w <bar> :exec '!/home/sasha/GAMSLINUX/gams' shellescape(@%, 1)<cr>
au BufNewFile,BufRead *.gms  setf gams

"
" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------
let g:yankring_history_dir = '~/.config/nvim/'
" Fix for yankring and neovim problem when system has non-text things
" copied in clipboard
let g:yankring_clipboard_monitor = 0

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" Fancy Symbols!!

if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else
    let g:webdevicons_enable = 0
endif

" Custom configurations ----------------

" Include user's custom nvim configurations

let custom_configs_path = "~/.config/nvim/custom.vim"
if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif

"bobik
" Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt  call HelpInNewTab()
augroup END

" Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction
" tex file compilation
nnoremap <leader>c :w<CR>:! pdflatex %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

" choosing default tex flavor
let g:tex_flavor = 'latex'

"bobik says - !!!fzf!!! - see help no fzf
" for greplace
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"snipmate config
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'

"php stuff
"function! IPhpInsertUse()
"    call PhpInsertUse()
"    call feedkeys('a',  'n')
"endfunction
"autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
"autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
"
"function! IPhpExpandClass()
"    call PhpExpandClass()
"    call feedkeys('a', 'n')
"endfunction
"autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
"autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>
"bobik renaming key in normal and visual modes in cyrillic
nmap [ ~
nmap Й Q
nmap Ц W
nmap У E
nmap К R
nmap Е T
nmap Н Y
nmap Г U
nmap Ш I
nmap Щ O
nmap З P
nmap Х {
nmap Ъ }
nmap Ф A
nmap Ы S
nmap І S
nmap В D
nmap А F
nmap П G
nmap Р H
nmap О J
nmap Л K
nmap Д L
nmap Ж :
nmap Э "
nmap Є "
nmap Ё \|
nmap Я Z
nmap Ч X
nmap С C
nmap М V
nmap И B
nmap Т N
nmap Ь M
nmap Б <
nmap Ю >

nmap ] `
nmap й q
nmap ц w
nmap у e
nmap к r
nmap е t
nmap н y
nmap г u
nmap ш i
nmap щ o
nmap з p
nmap х [
nmap ъ ]
nmap ф a
nmap ы s
nmap і s
nmap в dd
nmap а f
nmap п g
nmap р h
nmap о j
nmap л k
nmap д l
nmap ж ;
nmap э '
nmap є '
nmap ё \
nmap я z
nmap ч x
nmap с c
nmap м v
nmap и b
nmap т n
nmap ь m
nmap б ,
nmap ю .
nmap ї ]
nmap ґ \
nmap ' `


" :vmap - visual and select mode maps
vmap ] `
vmap й q
vmap ц w
vmap у e
vmap к r
vmap е t
vmap н y
vmap г u
vmap ш i
vmap щ o
vmap з p
vmap х [
vmap ъ ]
vmap ф a
vmap ы s
vmap і s
vmap в d
vmap а f
vmap п g
vmap р h
vmap о j
vmap л k
vmap д l
vmap ж ;
vmap э '
vmap є '
vmap ё \
vmap я z
vmap ч x
vmap с c
vmap м v
vmap и b
vmap т n
vmap ь m
vmap б ,
vmap ю .
vmap ї ]
vmap ґ \
vmap ' `

vmap [ ~
vmap Й Q
vmap Ц W
vmap У E
vmap К R
vmap Е T
vmap Н Y
vmap Г U
vmap Ш I
vmap Щ O
vmap З P
vmap Х {
vmap Ъ }
vmap Ф A
vmap Ы S
vmap В D
vmap А F
vmap П G
vmap Р H
vmap О J
vmap Л K
vmap Д L
vmap Ж :
vmap Э "
vmap Є "
vmap Ё \|
vmap Я Z
vmap Ч X
vmap С C
vmap М V
vmap И B
vmap Т N
vmap Ь M
vmap Б <
vmap Ю >
vmap Ї }
vmap ʼ ~
" bobik 2 next lines
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>
" Save session on quitting Vim
" Save session on quitting Vim
" autocmd VimLeave * NERDTreeClose
autocmd VimLeave * Obsess! ses.vim

"trigger snippets UltiSnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
