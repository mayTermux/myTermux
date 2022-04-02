#!/usr/bin/env bash

DEPENDENCY_PACKAGES=(
  clang make git binutils
)

for DEPENDENCY_PACKAGES in ${DEPENDENCY_PACKAGE[@]}; do
  pkg i -y ${DEPENDENCY_PACKAGE}
done

git clone https://github.com/mayTermux/nyancat.git $HOME/nyancat
cd $HOME/nyancat
make
strip src/nyancat
make install
echo -e "Compile & Install done!"
