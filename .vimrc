let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
:hi CursorColumn cterm=NONE ctermbg=darkred
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set cursorline
set cursorcolumn
nmap <C-N><C-N> :set invnumber<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

:highligh LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=DarkGrey

:colorscheme elflord
syn on

au BufNewFile,BufRead *.hbs set filetype=html

:highlight conl ctermfg=green
:match conl /console\..*(/


set runtimepath+=$HOME/.vim/plugins

function! Snip()
    let shellcmd = 'grep -r snippit /Users/kalebclark/.vim/snippits'.a
    let output=system(shellcmd)
    echo output
endfunction
