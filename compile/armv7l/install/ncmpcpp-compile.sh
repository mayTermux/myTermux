#!/usr/bin/env bash

DEPENDENCY_PACKAGES=(
  git clang autoconf automake 
  libtool pkg-config boost taglib
)

for DEPENDENCY_PACKAGE in ${DEPENDENCY_PACKAGES[@]}; do
  pkg i -y $DEPENDENCY_PACKAGE
done

git clone https://github.com/ncmpcpp/ncmpcpp $HOME/ncmpcpp
cd $HOME/ncmpcpp
libtoolize && aclocal && autoheader && autoconf && automake --add-missing
autoupdate
./autogen.sh
sed -i '36i\#include <linux/in.h>' src/screens/visualizer.cpp 
./configure --enable-outputs --enable-visualizer --enable-clock --enable-static-boost --with-taglib
make
strip src/ncmpcpp
cp $HOME/myTermux/compile/armv7l/config/ncmpcpp/config ~/.config/ncmpcpp/config
cp src/ncmpcpp $PREFIX/bin/ncmpcpp
mpd
ncmpcpp
