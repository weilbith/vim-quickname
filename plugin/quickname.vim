if exists('g:loaded_quickname')
  finish
endif

let g:loaded_quickname = 1


command! -nargs=? QuicknameSave call quickname#save(<f-args>)
command! -nargs=? QuicknameLoad call quickname#load(<f-args>)
command! -nargs=? QuicknameRemove call quickname#remove(<f-args>)

highlight QuicknameNormal ctermbg=237 ctermfg=NONE guibg=#3a3a3a guifg=NONE cterm=NONE gui=NONE

let g:quickname_current_list = ''

augroup Quickname
  autocmd!
  autocmd BufReadPost quickfix call quickname#clear_current_list()
augroup END
