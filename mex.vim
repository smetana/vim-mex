let g:slime_default_config = {"sessionname": "iex", "windowname": "0"}
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_dont_ask_default = 1

function! ExpandElixirMacro() range
  let n = @n
  silent! normal gv"ny
  SlimeSend0 "require Mex\n"
  SlimeSend0 "Mex.mex :all do\n"
  SlimeSend0 @n
  SlimeSend0 "end\n"
  let @n = n
  normal! gv
endfunction
map <C-c><C-e> :call ExpandElixirMacro()<CR>
