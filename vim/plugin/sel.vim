function! SelStart(addr)

    py import vim 
    py from selenium import selenium
    py sel = selenium('localhost', 4444, '*firefox', vim.eval('a:addr'))
    py sel.start()
    py sel.open('/')

endfunction

function! SelRefresh(query)

    py sel.open('/'+vim.eval('a:query'))

endfunction

command! -nargs=1 SelStart :call SelStart(<f-args>) 
command! -nargs=? SelRefresh :call SelRefresh(<f-args>) 
