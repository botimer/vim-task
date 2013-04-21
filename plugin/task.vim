" Boilerplate
if (exists("g:loaded_task"))
  finish
endif
let g:loaded_task = 1

let s:cpo_save = &cpo
set cpo&vim

function! Toggle_task_status(wipeout)
  let line = getline('.')
  let move = 0
  if match(line, '^\(\s*\)( )') == 0
    let line = substitute(line, '^\(\s*\)( )', '\1(X)', '')
  elseif match(line, '^\(\s*\)(X)') == 0
    if a:wipeout
      let line = substitute(line, '^\(\s*\)(X)\(\s\=\)\<', '\1', '')
      let move = -4
    else
      let line = substitute(line, '^\(\s*\)(X)\(\s\=\)\<', '\1( )\2', '')
    endif
  else
    let line = substitute(line, '^\(\s\{-}\)\(\s\=\)\<', '\2\1( ) ', '')
    let move = 4
  endif
  call setline('.', line)
  if move == 4
    normal 4l
  elseif move == -4
    normal 4h
  endif
endfunction

function! Make_task()
  let line = getline('.')
  if match(line, '^\s*$') == -1 && match(line, '^\(\s\+\)(.)') == -1
    let line = substitute(line, '^\(\s*\)', '\1( ) ', '')
    call setline('.', line)
    normal 4l
  end
endfunction


inoremap <silent> <C-CR> <ESC>:call Toggle_task_status(0)<CR>a
noremap <silent> <C-CR> :call Toggle_task_status(0)<CR>
inoremap <silent> <C-D-CR> <ESC>:call Toggle_task_status(0)<CR>ja
noremap <silent> <C-D-CR> :call Toggle_task_status(0)<CR>j

inoremap <silent> <C-S-CR> <ESC>:call Toggle_task_status(1)<CR>a
noremap <silent> <C-S-CR> :call Toggle_task_status(1)<CR>
inoremap <silent> <C-S-D-CR> <ESC>:call Toggle_task_status(1)<CR>ja
noremap <silent> <C-S-D-CR> :call Toggle_task_status(1)<CR>j

" Boilerplate
let &cpo = s:cpo_save
unlet s:cpo_save

