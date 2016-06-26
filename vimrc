" pathogen runtime path management
execute pathogen#infect()

" syntax highlighting
syntax enable

" line numbers on
set number

"relative line numbers
set relativenumber

" mouse support enabled
set mouse=a

" fast scrolling and redraws?
set ttyfast

" toggle filesystem tree navigation window
"map <C-b> :NERDTreeToggle<CR>

" set tab spacing based on filetype
filetype plugin indent on
" tab size is 2 spaces
set tabstop=2
set expandtab
set shiftwidth=2

" consistent indentation based on above line
set autoindent

" quick cycle through buffers
:nnoremap <C-m> :bnext<CR>
:nnoremap <C-n> :bprevious<CR>

" pretty word-wrap formatting
set linebreak
set breakindent

let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid

" set default register to the X11 clipboard
set clipboard=unnamedplus

" set fold method to syntax
set foldmethod=syntax
set foldlevelstart=20

" map spacebar to fold/unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" i hope this works
nnoremap <C-j> :!dometa.sh % <CR>

" renames tmux window to name of file open
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t"))
"autocmd VimLeave * call system("tmux set automatic-rename on")

" searching for text
set incsearch
" highlight all search instances
set hlsearch
set ignorecase
set smartcase

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" allow hidden buffers so you can :e a new file without
" vim whining that you have unsaved changes
set hidden

" Fix 256-color in tmux and vim
if &term =~ '256color'
  set t_ut=
endif

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" remap j/k to gj/gk respectively to move up and down properly
" on word-wrapped lines. if there is no count, use j/k normally
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" explorer mode shows file structure
let g:netrw_liststyle=3

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" powerline fonts in airline
let g:airline_powerline_fonts = 1

" vim-airline wants this to actually display something by default
set laststatus=2
" vim-airline buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'term'

" large file size
let g:LargeFile=10
