#!/bin/bash

set -e 

unset CC


# we wish to use clang from now on 
#export CC=clang

make distclean

# --with-json option dropped due to elisp version integrated faster??

./configure \
    --prefix=/opt/emacs \
    --with-wide-int \
    --with-x-toolkit=gtk3 \
    --without-xaw3d \
    --with-libsystemd \
    --without-compress-install \
    --with-native-compilation \
    --with-tree-sitter \
    --with-mailutils \
    --with-cairo \
    --with-harfbuzz \
    --with-imagemagick \
  CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"

make bootstrap

make -j8
sudo make install

