function! quickname#ui#get_name_input() abort
  while v:true
    let l:name = input('Please enter the lists name: ')

    if !empty(l:name)
      return l:name
    else
      echo 'Can not store lits with an empty name!'
    endif
  endwhile
endfunction

function! quickname#ui#get_confirmation(message) abort
  let l:response = confirm(a:message, "&Yes\n&No", 2, 'Question')
  return l:response == 1
endfunction

function! quickname#ui#pick_stored_list_name() abort
  let l:names = quickname#cache#get_cached_names()
  let l:selection_options = s:build_selection_by_names(l:names)
  echo 'Select a list: '
  let l:choice = inputlist(l:selection_options)
  return l:names[l:choice - 1]
endfunction

function! s:build_selection_by_names(names) abort
  let l:active_quickfix_list = getqflist()
  let l:selection_options = []
  let l:index = 1

  for name in a:names
    let l:list = quickname#cache#get_cached_list(name)
    let l:is_current_list = l:list == l:active_quickfix_list
    let l:current_list_marker = l:is_current_list ? ' > ' : '   '
    let l:option = l:current_list_marker . l:index . ' - ' . name . ' (' . len(l:list) . ')'
    call add(l:selection_options, l:option)
    let l:index = l:index + 1
  endfor

  return l:selection_options
endfunction
