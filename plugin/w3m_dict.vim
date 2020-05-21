" 有道查询
nnoremap <leader>Y :set operatorfunc=<SID>DictSearchOpertion<cr>g@
vnoremap <leader>Y :<c-u>call <SID>DictSearchOpertion(visualmode())<cr>

" TODO 只打开一个单词搜索窗口
function! s:DictSearch(word)
    botright new
    " vsplit __YoudaoDict__
    execute "W3m http://dict.youdao.com/search?q=" . a:word
    let g:dict_buf_name = bufname("%")
    let g:dict_return_to_window = winnr()
endfunction

function! s:DictSearchOpertion(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else 
        echom "Multiple line not support"
        finish
    endif

    call s:DictSearch(@@)

    let @@ = saved_unnamed_register
endfunction


