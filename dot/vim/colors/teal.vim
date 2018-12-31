" vim colorscheme for Teal

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="teal"


"hi Normal           ctermfg=250
"hi CursorLine                   ctermbg=232 cterm=none
"hi Boolean          ctermfg=200
"hi Character        ctermfg=178
"hi Number           ctermfg=200
"hi String           ctermfg=178
"hi Conditional      ctermfg=220             cterm=bold
"hi Constant         ctermfg=200             cterm=bold
"hi Cursor           ctermfg=16  ctermbg=253
"hi Debug            ctermfg=225             cterm=bold
"hi Define           ctermfg=75
"hi Delimiter        ctermfg=241

"hi DiffAdd                      ctermbg=23
"hi DiffChange       ctermfg=181 ctermbg=237
"hi DiffDelete       ctermfg=162 ctermbg=53
"hi DiffText                     ctermbg=52  cterm=bold

"hi Directory        ctermfg=112             cterm=bold
"hi Error            ctermfg=189 ctermbg=89
"hi ErrorMsg         ctermfg=219             cterm=bold
"hi Exception        ctermfg=220             cterm=bold
"hi Float            ctermfg=200
"hi FoldColumn       ctermfg=67  ctermbg=16
"hi Folded           ctermfg=67  ctermbg=16
"hi Function         ctermfg=112
"hi Identifier       ctermfg=112             cterm=none
"hi Ignore           ctermfg=244 ctermbg=232
"hi IncSearch        ctermfg=75

"hi Keyword          ctermfg=220             cterm=bold
"hi Label            ctermfg=220             cterm=none
"hi Macro            ctermfg=75

"hi MatchParen       ctermfg=208 ctermbg=16  cterm=bold
"hi ModeMsg          ctermfg=220
"hi MoreMsg          ctermfg=220
"hi Operator         ctermfg=220

"hi PreCondit        ctermfg=220             cterm=bold
"hi PreProc          ctermfg=75
"hi Question         ctermfg=75
"hi Repeat           ctermfg=220             cterm=bold
"hi Search           ctermfg=253 ctermbg=66

"" marks column
"hi SignColumn       ctermfg=112 ctermbg=235
"hi SpecialChar      ctermfg=200
"hi SpecialComment   ctermfg=244             cterm=bold
"hi Special          ctermfg=75  ctermbg=232

"hi Statement        ctermfg=220             cterm=bold
"hi StatusLine       ctermfg=238 ctermbg=253
"hi StatusLineNC     ctermfg=244 ctermbg=232
"hi StorageClass     ctermfg=112
"hi Structure        ctermfg=75
"hi Tag              ctermfg=220
"hi Title            ctermfg=166
"hi Todo             ctermfg=231 ctermbg=232 cterm=bold

"hi Typedef          ctermfg=112
"hi Type             ctermfg=112             cterm=none
"hi Underlined       ctermfg=244             cterm=underline

"hi VisualNOS                    ctermbg=238
"hi Visual                       ctermbg=25
"hi WarningMsg       ctermfg=231 ctermbg=238 cterm=bold
"hi WildMenu         ctermfg=75

"hi Comment          ctermfg=244
"hi CursorColumn                 ctermbg=232
"hi ColorColumn                  ctermbg=232
"hi NonText          ctermfg=244
"hi SpecialKey       ctermfg=244


" layout
hi LineNr           cterm=bold ctermfg=244 ctermbg=235
hi VertSplit        cterm=bold ctermfg=244 ctermbg=246

" tab line
hi TabLine          cterm=none

" completion menu
hi Pmenu            ctermfg=250 ctermbg=238
hi PmenuSel         ctermfg=255 ctermbg=25
hi PmenuSbar                    ctermbg=234
hi PmenuThumb       ctermfg=250

