" diagnostics

function! easycomplete#action#diagnostics#do()
  " 确保从这里 fire 的 diagnostic 才会被更新渲染
  if !easycomplete#util#LspServerReady() | return | endif
  call easycomplete#lsp#notify_diagnostics_update()
  call easycomplete#lsp#ensure_flush_all()
  call s:AsyncRun(function('easycomplete#action#diagnostics#render'),
        \ [], g:easycomplete_diagnostics_render_delay)
endfunction

function! easycomplete#action#diagnostics#HandleCallback(server, response)
  call easycomplete#sign#flush()
  call easycomplete#sign#cache(a:response)
endfunction

function! easycomplete#action#diagnostics#render()
  call easycomplete#sign#hold()
  call easycomplete#sign#render()
endfunction

function! s:AsyncRun(...)
  return call('easycomplete#util#AsyncRun', a:000)
endfunction

function! s:console(...)
  return call('easycomplete#log#log', a:000)
endfunction
