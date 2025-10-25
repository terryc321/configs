#!/bin/bash

set -e 

./configure \
    --prefix=/opt/emacs \
    --with-wide-int \
    --with-x-toolkit=gtk3 \
    --without-xaw3d \
    --with-libsystemd \
    --without-compress-install \
    --with-native-compilation \
    --with-tree-sitter \
    --with-json \
    --with-mailutils \
    --with-cairo \
    --with-harfbuzz \
    --with-imagemagick \
  CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"

make -j8
sudo make install

