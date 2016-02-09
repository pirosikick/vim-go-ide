set t_Co=256
set list
set listchars=tab:^_,trail:-,extends:>,precedes:<,eol:$
" Using the mouse on a terminal.
" http://yskwkzhr.blogspot.jp/2013/02/use-mouse-on-terminal-vim.html
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif
" Use clipboard
if has('clipboard')
  set clipboard=unnamed
endif

" Plugin settings
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:syntastic_auto_loc_list = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:neosnippet#snippets_directory=[
      \'~/.vim_go_runtime/bundle/pristine/vim-go/gosnippets/snippets',
      \'~/.vim_go_runtime/bundle/pristine/neosnippet-snippets/neosnippets',
      \]

" Map
" neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"

augroup MyAugroup
  autocmd!
  autocmd FileType go nnoremap <buffer> <Leader>i :GoImport 
  autocmd FileType nerdtree nnoremap <buffer> <Leader>r :NERDTree<cr>
augroup END
