set noshowmode
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [
    \     ['mode', 'paste'],
    \     ['gitbranch', 'readonly', 'filename', 'modified'],
    \     ['cocstatus'],
    \     ['currentfunction'],
    \   ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction'
    \ },
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
    \}

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
