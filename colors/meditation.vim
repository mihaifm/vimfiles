set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "meditation"

"""""""""""""
" Colors used

" #222222                   (background)
" Orange #FFA500            (cursor)
" DeepSkyBlue #00BFFF       (html, xml) 
" DarkSlateGray #2F4F4F     (visual, cursor line)
" Skyblue #87CEEB           (function)
" #999999                   (comments)
" LightCoral #F08080        (strings)
" Turquoise #40E0D0         (identifiers)
" Gold #FFD700              (folders)
" AntiqueWhite  #FAEBD7     (normal)
" DimGray #696969           (non-text, misc gui)
" Black #000000             (folded)
" Lime #00FF00              (user group)
" #E0E000                   (user group)
" #333333                   (statusline bg)
" #444444                   (vert split)

"""""""""
" General 

hi Normal       guifg=#FAEBD7	 guibg=#222222
hi! link FoldColumn Normal

hi Visual                     guibg=#2F4F4F 
hi! link CursorLine Visual

hi Cursor                     guibg=#FFA500
hi MatchParen                 guibg=#2F4F4F

hi Directory    guifg=#FFD700 
hi Folded       guifg=#000000

hi NonText      guifg=#696969               gui=NONE

""""""
" GUI

hi VertSplit    guifg=#444444 guibg=#696969
hi Pmenu                      guibg=#696969 
hi StatusLine   guifg=#FFD700 guibg=#666666 gui=NONE 
hi StatusLineNC guifg=#696969 guibg=#444444 gui=NONE

""""""""""""""
" User groups

hi User1        guifg=#E0E000 guibg=#666666 gui=NONE
hi User2        guifg=#00BFFF guibg=#666666 gui=NONE
hi User3        guifg=#00FF00 guibg=#666666 gui=NONE
hi User4        guifg=#FF0000 guibg=#666666 gui=NONE

"""""""""
" Syntax

" hi Comment       guifg=#8FBC8F
" hi Comment       guifg=#BC9357
" hi! Comment      guifg=#DEB887
hi! Comment    guifg=#999999

hi! link Todo Comment
hi! link SpecialComment Comment

hi String       guifg=#F08080
hi! link Special String
hi! link Number String
hi! link Character String
hi! link Title String

hi Function     guifg=#87CEEB

hi Identifier   guifg=#40E0D0
hi! link Constant Identifier
hi! link Define Identifier
hi! link Statement Identifier
hi! link Include Identifier
hi! link Boolean Identifier
hi! link Type Identifier
hi! link Conditional Identifier
hi! link Operator Identifier
hi! link Keyword Identifier
hi! link Macro Identifier
hi! link PreCondit Identifier
hi! link StorageClass Identifier
hi! link Structure Identifier
hi! link Typedef Identifier
hi! link Tag Identifier
hi! link Delimiter Identifier
hi! link Debug Identifier
hi! link PreProc Identifier

""""""""""""""""""""
" Language specific

hi! link javaScriptBraces Normal
hi! link rubyStringDelimiter String
hi! link railsMethod Keyword

hi xmlTag       guifg=#00BFFF 
hi! link xmlTagName  xmlTag
hi! link xmlEndTag   xmlTag
hi! link xmlArg      xmlTag
hi! link htmlTag     xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag  xmlEndTag
hi! link htmlArg     xmlArg

hi! link perlSigil xmlTag
