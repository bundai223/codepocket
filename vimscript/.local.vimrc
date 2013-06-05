
" 文字コードなどを設定
" cppとnutに限定するべきっぽい
setlocal noexpandtab
au BufNew,BufRead *.nut setlocal fileformat=dos
au BufNew,BufRead *.nut setlocal encoding=sjis
au BufNew,BufRead *.cpp setlocal fileformat=dos
au BufNew,BufRead *.cpp setlocal encoding=sjis
au BufNew,BufRead *.h setlocal fileformat=dos
au BufNew,BufRead *.h setlocal encoding=sjis

" プロジェクトのtagファイルをよみこむ
setlocal tags=~/labo/graphic/trunk/graphic_base/tags

" pathを通す
let b:PROJECT_NAME = 'graphic'
let b:PROJECT_ROOT = '~/labo/graphic/trunk/graphic_base/'

setlocal path+=~/labo/graphic/trunk/lib/ml/include/
setlocal path+=~/labo/graphic/trunk/graphic_base/

"--------------------------------------------------------------------------------
" plugin
"--------------------------------------------------------------------------------
"let g:neosnippet#snippets_directory='~/labo/graphic/trunk/graphic_base/personal'

