" Vim Code Dark (color scheme)
" https://github.com/tomasiser/vim-code-dark

scriptencoding utf-8

set background=dark
" hi clear
" let g:colors_name="codedark"

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)

if &t_Co >= 256
    let g:codedark_term256=1
elseif !exists("g:codedark_term256")
    let g:codedark_term256=0
endif

fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . (g:codedark_term256 ? a:fg.cterm256 : a:fg.cterm)
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . (g:codedark_term256 ? a:bg.cterm256 : a:bg.cterm)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
  endif
endfun

" ------------------
" Color definitions:
" ------------------

" Terminal colors (base16):
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "00"
  let s:cterm02 = "08"
  let s:cterm04 = "07"
  let s:cterm06 = "07"
  let s:cterm09 = "06"
  let s:cterm0F = "03"
endif

" General appearance colors:
" (some of them may be unused)

let s:cdFront = {'gui': '#D4D4D4', 'cterm': s:cterm05, 'cterm256': '188'}

" Syntax colors:

let s:cdGray = {'gui': '#808080', 'cterm': s:cterm04, 'cterm256': '08'}
let s:cdViolet = {'gui': '#646695', 'cterm': s:cterm04, 'cterm256': '60'}
let s:cdBlue = {'gui': '#569CD6', 'cterm': s:cterm0D, 'cterm256': '75'}
let s:cdDarkBlue = {'gui': '#223E55', 'cterm': s:cterm0D, 'cterm256': '73'}
let s:cdLightBlue = {'gui': '#9CDCFE', 'cterm': s:cterm0C, 'cterm256': '117'}
let s:cdGreen = {'gui': '#6A9955', 'cterm': s:cterm0B, 'cterm256': '65'}
let s:cdBlueGreen = {'gui': '#4EC9B0', 'cterm': s:cterm0F, 'cterm256': '43'}
let s:cdLightGreen = {'gui': '#B5CEA8', 'cterm': s:cterm09, 'cterm256': '151'}
let s:cdRed = {'gui': '#F44747', 'cterm': s:cterm08, 'cterm256': '203'}
let s:cdOrange = {'gui': '#CE9178', 'cterm': s:cterm0F, 'cterm256': '173'}
let s:cdLightRed = {'gui': '#D16969', 'cterm': s:cterm08, 'cterm256': '167'}
let s:cdYellowOrange = {'gui': '#D7BA7D', 'cterm': s:cterm0A, 'cterm256': '179'}
let s:cdYellow = {'gui': '#DCDCAA', 'cterm': s:cterm0A, 'cterm256': '187'}
let s:cdPink = {'gui': '#C586C0', 'cterm': s:cterm0E, 'cterm256': '176'}
let s:cdSilver = {'gui': '#C0C0C0', 'cterm': s:cterm05, 'cterm256': '7'}

" nvim-cmp
call <sid>hi('CmpItemAbbrDeprecated', s:cdGray, {}, 'strikethrough', {})
call <sid>hi('CmpItemAbbrMatch', s:cdBlue, {}, 'none', {})
call <sid>hi('CmpItemAbbrMatchFuzzy', s:cdBlue, {}, 'none', {})
call <sid>hi('CmpItemKindVariable', s:cdLightBlue, {}, 'none', {})
call <sid>hi('CmpItemKindInterface', s:cdLightBlue, {}, 'none', {})
call <sid>hi('CmpItemKindText', s:cdLightBlue, {}, 'none', {})
call <sid>hi('CmpItemKindFunction', s:cdPink, {}, 'none', {})
call <sid>hi('CmpItemKindMethod ', s:cdPink, {}, 'none', {})
call <sid>hi('CmpItemKindKeyword', s:cdFront, {}, 'none', {})
call <sid>hi('CmpItemKindProperty', s:cdFront, {}, 'none', {})
call <sid>hi('CmpItemKindUnit', s:cdFront, {}, 'none', {})

