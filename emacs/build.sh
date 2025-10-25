#!/bin/bash

set -e 

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

make -j8
sudo make install

