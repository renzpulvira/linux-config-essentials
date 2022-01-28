set fileformat=unix
set nu rnu
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set linespace=5
set expandtab
set signcolumn=yes
set background=dark
set backspace=indent,eol,start
set laststatus=2
"set statusline=%f
"set statusline=%f\ \ %y%m%r%h%w%=[%l,%v]\ \ \ \ \ \ [%L,%p%%]\ %n

set incsearch
set hlsearch

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
"Plug 'bluz71/vim-moonfly-colors'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Plug 'morhetz/gruvbox'
"Plug 'fcpg/vim-fahrenheit'
Plug 'chiedo/vim-px-to-em'
"Plug 'karb94/neoscroll.nvim'



set encoding=UTF-8

call plug#end() 

"lua require('neoscroll').setup()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <c-n> :nerdtree<cr>
nnoremap <C-t> :NERDTreeToggle<CR>
" autocmd BufEnter * call SyncTree()

nmap <F8> :TagbarToggle<CR>

"let g:gruvbox_contrast_dark = 'hard'
" colorscheme fahrenheit 
colorscheme ayu 

" airline
" let g:airline_powerline_fonts = 1
" let g:airline_theme='minimalist'



" Emmet Settings
let g:user_emmet_mode='a'


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

"gruvbox

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set splitbelow
set splitright






set cmdheight=2

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-styled-components',
  \ ]

nmap <F2> <Plug>(coc-rename)


nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList coemands<cr>
" Find symbol of cur" This will fix the popup getting stuck
"enoremap <silent> <ESC><ESC> :nohlsearch \| match none \| 2match none \| call coc#float#close_all()<CR>rent document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Restart COC
nnoremap <silent> <leader>cr :<C-u>CocRestart<CR>

" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"




" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" fzf and ripgrep settings
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit'
    \ }




" Signify Settings
let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" 256 color workaround
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 <
    "https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
  "https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
  ">
  "Based on Vim patch 7.4.1770 (`guicolors` option) <
  "https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
  "">
  " <
  "https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
  ">
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set termguicolors


" Useful Keybindings
" Emmet
let g:user_emmet_leader_key='<C-L>'

" Window
nnoremap <silent> <space>wv :<C-u>vsp<Cr>
nnoremap <silent> <space>ws :<C-u>sp<Cr>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Fuzzy finder
nnoremap <silent> <space>p :<C-u>Files<Cr>
nnoremap <silent> <space>b :<C-u>Buffers<Cr>

"Saving & exiting a file
nnoremap <silent> <space>w :<C-u>w<Cr>
nnoremap <silent> <space>q :<C-u>q<Cr>

nnoremap <silent> <space><space>r :<C-u>CocRestart<Cr>
nnoremap <silent> <space>n :<C-u>nohl<Cr>
nnoremap <silent> <space>t :<C-u>NERDTreeFocus<Cr>


" This will fix the popup getting stuck
nnoremap<silent> <space>fx :<C-u>nohlsearch \| match none \| 2match none \| call coc#float#close_all()<Cr>



"Tab Shortcuts
nnoremap <silent> <space>1 1gt<CR>
noremap <silent> <space>2 2gt<CR> 
noremap <silent> <space>3 3gt<CR> 
noremap <silent> <space>4 4gt<CR> 
noremap <silent> <space>5 5gt<CR> 
noremap <silent> <space>6 6gt<CR> 
noremap <silent> <space>7 7gt<CR> 
noremap <silent> <space>8 8gt<CR> 
noremap <silent> <space>9 9gt<CR> 
noremap <silent> <leader>0 :tablast<cr>

nnoremap H gT
nnoremap L gt
autocmd BufEnter NERD_tree_* | execute 'normal R'

nnoremap <space>l <C-w>l
nnoremap <space>h <C-w>h
nnoremap <space>ff /
imap ii <Esc>


let g:fzf_buffers_jump = 1
let g:fzf_action = {
\ 'enter': 'FzfCustomOpen',
\ 'ctrl-t': 'tab split',
\ 'ctrl-l': 'vsplit' }

function! WhichWindowId(filename)
    let buffername = bufname(a:filename)
    if buffername == ""
        return 0
    endif
    let buffernumber = bufnr(buffername)
    let windows = win_findbuf(buffernumber)
    if len(windows) >=1
        return get(windows,0) 
    endif
    return 0
endfunction

function! s:fzfOpen(...)
    if len(a:000)==0
        return
    endif
    let windowId = WhichWindowId(a:1)
    if windowId>0
        execute 'call win_gotoid('.windowId.')'
    else
        if &modified
            execute 'tabnew '.join(a:000)
        else
        "open in the same window
        execute 'edit '.join(a:000)
        endif
  endif
endfunction

command!  -nargs=* FzfCustomOpen call s:fzfOpen(<f-args>)

let g:airline#extensions#tabline#enabled = 1

nnoremap <space>h :w !node<CR>
nnoremap <space><space>h :w !python3<CR>
