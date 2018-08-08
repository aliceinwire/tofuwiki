" Vim script that turns Vim into a personal wiki
" Maintainer:	Daniel Choi <dhchoi@gmail.com>
" License: MIT License (c) 2011 Daniel Choi

if exists("g:TofuWikiStarterLoaded") || &cp || version < 700
  finish
endif
let g:TofuWikiStarterLoaded = 1


func! Tofuwiki()
  source /Users/misha/.rvm/gems/ruby-1.9.2-p136/gems/tofuwiki-0.7.2/lib/tofuwiki.vim
endfunc

command! -bar -nargs=0 Tofuwiki :call Tofuwiki()

