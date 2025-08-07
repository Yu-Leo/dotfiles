let mapleader = " "

nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>

nnoremap <leader>q :q<CR>
nnoremap <C-q> :confirm qall<CR>

nnoremap <leader>f ciwf<Esc>

function! ReplaceFirstWordToF()
  let lnum = line(".")
  while lnum <= line("$")
    let line_text = getline(lnum)
    let new_line = substitute(line_text, '^\s*\zs\w\+', 'f', '')
    call setline(lnum, new_line)
    let lnum += 1
  endwhile
endfunction

nnoremap <leader>F :call ReplaceFirstWordToF()<CR>
