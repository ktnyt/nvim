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
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_file)

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

let g:deoplete#enable_at_startup = 1

"" Keymaps
" For use with ErgoDox EZ
"nnoremap ; :
"nnoremap : ;

noremap j gj
noremap k gk

nnoremap <SPACE> <Nop>
nnoremap <silent><SPACE>p :bp<CR>
nnoremap <silent><SPACE>n :bn<CR>
nnoremap <silent><SPACE>d :bd<CR>
nnoremap <silent><SPACE>w :bp\|bd #<CR>

nmap <S-h> ^
nmap <S-j> G
nmap <S-k> gg
nmap <S-l> $

nnoremap <C-l> zz

"" colors
colorscheme nord

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

"" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

"" ale
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 1

let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_change = 'never'

let g:ale_linters = { 'go': ['gofmt'] }

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
let g:airline#extensions#ale#enabled= 1

" PlantUML
au FileType pu set noexpandtab
au FileType pu set shiftwidth=2
au FileType pu set softtabstop=2
au FileType pu set tabstop=2
