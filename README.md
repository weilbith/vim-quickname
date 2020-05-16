# Vim Quickfix Lists with Names

A minimalistic Vim plugin to save your quickfix lists with a name to make is
easily recoverable. Instead of traversing through the quickfix lists history
with `:colder` and `:cnewer` this allows to jump directly to lists of interest.
Additionally it includes some tiny features to select, highlight and also
integrate reloaded quickfix lists into you status line. Checkout the
documentation for details of how the user flow look like and how to customize
it.

## Installation

Install the plugin with your favorite manager tool. Here is an example using
[dein.vim](https://github.com/Shougo/dein.vim):

```vim
call dein#add('weilbith/vim-quickname', {
      \ 'on_cmd': ['QuicknameSave', 'QuicknameLoad', 'QuicknameRemove']
      \ })
```
