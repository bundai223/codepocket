
cd ~/sample/vim/src

# configure +python +python3 +ruby +perl +lua
./configure \
--with-features=huge \
--enable-multibyte \
--enable-perlinterp \
--enable-pythoninterp \
--enable-python3interp \
--enable-rubyinterp \
--enable-luainterp \
--with-luajit \
--enable-cscope \
--enable-fontset \
--enable-fail-if-missing
