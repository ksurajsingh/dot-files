" Enable autosave on changes
augroup autosave
    autocmd!
    " Save file when there are changes
    autocmd TextChanged,TextChangedI * silent! wa
augroup END

