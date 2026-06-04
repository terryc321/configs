#!/bin/bash

set -e

# ================== CONFIGURATION ==================

PREFIX=/opt/emacs-30.2
JOBS=$(nproc)                    # Use all available cores

# Optional: Use Clang instead of GCC (faster compilation on some systems)
# export CC=clang
# export CXX=clang++

# ================== CLEAN ==================
make distclean || true

./autogen.sh

# ================== CONFIGURE ==================

./configure \
    --prefix="$PREFIX" \
    --build=x86_64-pc-linux-gnu \
    --host=x86_64-pc-linux-gnu \
    --with-wide-int \
    --with-x-toolkit=gtk3 \
    --with-pgtk \
    --with-libsystemd \
    --without-compress-install \
    --with-native-compilation \
    --with-tree-sitter \
    --with-mailutils \
    --with-cairo \
    --with-harfbuzz \
    --with-imagemagick \
    --with-rsvg \
    --with-webp \
    --with-sqlite3 \
    CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer -fno-plt"

#--without-xaw3d \
    
    
# ================== BUILD ==================

echo "=== Starting bootstrap (this takes time) ==="
make bootstrap -j"$JOBS"

echo "=== Building Emacs ==="
make -j"$JOBS"

# ================== INSTALL ==================
sudo make install

echo "=== Emacs 30.2 successfully installed to $PREFIX ==="
echo "You can run it with: $PREFIX/bin/emacs"

