let g:quickname_cache_data = {}

function! quickname#cache#user_possibly_cancels_overwriting(name) abort
  if !quickname#cache#entry_exists(a:name) | return | endif
  let l:message = 'A cached list with the exact same name does already exist. Do you want to overwrite it?'
  return !quickname#ui#get_confirmation(l:message)
endfunction

function! quickname#cache#save_list(name) abort
  let l:quickfix_list = getqflist()
  let g:quickname_cache_data[a:name] = l:quickfix_list
endfunction

function! quickname#cache#entry_exists(name) abort
  return has_key(g:quickname_cache_data, a:name)
endfunction

function! quickname#cache#restore(name) abort
  let l:quickfix_list = quickname#cache#get_cached_list(a:name)
  call setqflist(l:quickfix_list)
endfunction

function! quickname#cache#delete(name) abort
  unlet g:quickname_cache_data[a:name]
endfunction

function! quickname#cache#get_cached_list(name) abort
  return g:quickname_cache_data[a:name]
endfunction

function! quickname#cache#get_cached_names() abort
  return sort(keys(g:quickname_cache_data))
endfunction
