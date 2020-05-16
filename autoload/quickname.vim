function! quickname#save(...) abort
  if !quickname#utils#quickfix_list_exists()
    echo 'No quickfix available at the moment!'
    return
  endif

  let l:name = quickname#utils#get_name(a:000)
  if quickname#cache#user_possibly_cancels_overwriting(l:name) | return | endif
  call quickname#cache#save_list(l:name)
  echo 'List successfully saves as "' . l:name . '"'
endfunction

function! quickname#load(...) abort
  let l:name = quickname#utils#pick_list_name(a:000)

  if !quickname#cache#entry_exists(l:name)
    echo 'There is no list named "' . l:name . '"'
    return
  endif

  call quickname#cache#restore(l:name)
  call quickname#utils#highlight(l:name)
  echo 'List successfully restored.'
endfunction

function! quickname#remove(...) abort
  let l:name = quickname#utils#pick_list_name(a:000)

  if !quickname#cache#entry_exists(l:name)
    echo 'There is no list named "' . l:name . '"'
    return
  endif

  call quickname#cache#delete(l:name)
  echo 'List successfully deleted.'
endfunction

function! quickname#clear_current_list() abort
  if quickname#utils#is_location_list_window() | return | endif
  let g:quickname_current_list = ''
  setlocal winhighlight<
endfunction
