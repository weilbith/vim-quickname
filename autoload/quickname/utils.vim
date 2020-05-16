function! quickname#utils#quickfix_list_exists() abort
  let l:quickfix_list = getqflist()
  return !empty(l:quickfix_list)
endfunction

function! quickname#utils#get_name(...) abort
  let l:unpacked_arguments = a:000[0]

  if empty(l:unpacked_arguments)
    return quickname#ui#get_name_input()
  else
    return l:unpacked_arguments[0]
  endif
endfunction

function! quickname#utils#pick_list_name(...) abort
  let l:unpacked_arguments = a:000[0]

  if empty(l:unpacked_arguments)
    return quickname#ui#pick_stored_list_name()
  else
    return l:unpacked_arguments[0]
  endif
endfunction

function! quickname#utils#highlight(name) abort
  let g:quickname_current_list = a:name
  let l:winhighlight = get(g:, 'quickname_winhighlight', 'QuicknameNormal')

  if !empty(l:winhighlight)
    execute 'setlocal winhighlight=Normal:' . l:winhighlight
  endif
endfunction

function! quickname#utils#is_location_list_window() abort
  let l:window_id = win_getid()
  let l:window_info = getwininfo(l:window_id)[0]
  let l:quickfix_option = get(l:window_info, 'quickfix', 0)
  let l:location_option = get(l:window_info, 'loclist', 0)
  return &filetype ==# 'qf' && l:quickfix_option && l:location_option
endfunction
