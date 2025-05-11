" Alternative Vim syntax for LilyPond files (.ly)

if exists("b:current_syntax")
    finish
endif

syn match   lilypondKeyword     "\\\S\+"
syn match   lilypondNote        "[cdefgabrs]\(is\|es\)\?[0-9]\+"
syn match   lilypondLiteral     "\"[^\"]*\""
syn match   lilypondComment     "%.*$"

highlight   lilypondKeyword     ctermfg=Blue        cterm=bold
highlight   lilypondNote        ctermfg=Green
highlight   lilypondLiteral     ctermfg=Yellow      cterm=italic
highlight   lilypondComment     ctermfg=Gray        cterm=italic

let b:current_syntax = "lilypond"
