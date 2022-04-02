#!/usr/bin/env bash

DEPENDENCY_PACKAGES=(
  git clang autoconf automake binutils
  libtool pkg-config boost taglib
)

for DEPENDENCY_PACKAGE in ${DEPENDENCY_PACKAGES[@]}; do
  pkg i -y $DEPENDENCY_PACKAGE
done

git clone --depth=1 https://github.com/ncmpcpp/ncmpcpp $HOME/ncmpcpp
cd $HOME/ncmpcpp
libtoolize && aclocal && autoheader && autoconf && automake --add-missing
autoupdate
./autogen.sh
sed -i '36i\#include <linux/in.h>' src/screens/visualizer.cpp 
./configure --enable-outputs --enable-visualizer --enable-clock --enable-static-boost --with-taglib
make
strip src/ncmpcpp
cp $HOME/myTermux/optional/compile/config/ncmpcpp/config-0.9\^ ~/.config/ncmpcpp/config
cp src/ncmpcpp $PREFIX/bin/ncmpcpp
echo -e "Compile & Install done!"
mpd
ncmpcpp
