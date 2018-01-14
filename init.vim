if !&compatible
  set nocompatible
endif

" dein settings {{{
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:lazy_file = fnamemodify(expand('<sfile>'), ':h').'/lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_file, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" }}}

" General
set number

set encoding=utf8

set completeopt=menuone

"" Tab Emulation
let g:deoplete#enable_at_startup = 1

"" Keymaps
" For use with ErgoDox EZ
"nnoremap ; :
"nnoremap : ;

inoremap <silent>jk <ESC>

nnoremap <silent>gh <C-w>h
nnoremap <silent>gj <C-w>j
nnoremap <silent>gk <C-w>k
nnoremap <silent>gl <C-w>l

nnoremap <silent>gH <C-w>H
nnoremap <silent>gJ <C-w>J
nnoremap <silent>gK <C-w>K
nnoremap <silent>gL <C-w>L

nnoremap <silent>gp :bp<CR>
nnoremap <silent>gn :bn<CR>
nnoremap <silent>gw :Bdelete<CR>
nnoremap <silent>gq :bufdo :Bdelete<CR>

nnoremap <silent>g[ :tabp<CR>
nnoremap <silent>g] :tabn<CR>

nnoremap <silent>ge :NERDTreeFocus<CR>

nnoremap <C-l> zz

"" colors
colorscheme nord

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"" ale
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 1

let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_change = 'never'

let g:ale_linters = { 'go': ['gometalinter'] }
let g:ale_go_gometalinter_options = '--fast --disable gotype'

let g:airline#extensions#ale#enabled= 1

" Go
au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" React
let g:jsx_ext_required = 0
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

" PlantUML
au FileType pu set expandtab
au FileType pu set shiftwidth=2
au FileType pu set softtabstop=2
au FileType pu set tabstop=2

" Python
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4
