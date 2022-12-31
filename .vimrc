syntax enable

" show line number
set number

" support 256 colors
set t_Co=256


set tabstop=4
set expandtab
set autoindent
set hlsearch
set cursorline
set cursorcolumn
set showcmd

"coc configuration
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by
" counting
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time 
" diagnotics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to
" enable no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command 'verbose imap <tap>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
                        \ coc#pum#visible() ? coc#pum#next(1) :
                        \ CheckBackspace() ? "\<Tab>" :
                        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to fromat
" <C=g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col -1] =~# '\s'
endfunction

" Use <c-space> to trigger comptetion
if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
else
        inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use '[g' and ']g' to navigate diagnostics
" Use ':CocDiagnostics' to get all diagnostics of current buffer in location
" list
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> ]g <Plug>(coc-diagnostics-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implemention)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
                call CocActionAsync('doHover')
        else
                call feedkeys('K', 'in')
        endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formating selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
call plug#end()
colorscheme evening 

" coc plugin list
let g:coc_global_extensions = [
                        \ 'coc-tsserver',
                        \ 'coc-prettier',
                        \ 'coc-pairs',
                        \ 'coc-lists',
                        \ 'coc-html',
                        \ 'coc-highlight',
                        \ 'coc-eslint',
                        \ 'coc-emmet',
                        \ 'coc-json',
                        \ 'coc-css']


