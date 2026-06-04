#!/bin/bash

set -e

# ================== CONFIGURATION ==================

PREFIX=/opt/emacs
JOBS=$(nproc)                    # Use all available cores

# Optional: Use Clang instead of GCC (faster compilation on some systems)
# export CC=clang
# export CXX=clang++

# ================== CLEAN ==================
make distclean || true

# ================== CONFIGURE ==================

./configure \
    --prefix="$PREFIX" \
    --with-wide-int \
    --with-x-toolkit=gtk3 \
    --with-pgtk \                    # ← Recommended for Wayland + better scaling
    --without-xaw3d \
    --with-libsystemd \
    --without-compress-install \
    --with-native-compilation \      # Still explicit is fine (now default)
    --with-tree-sitter \
    --with-mailutils \
    --with-cairo \
    --with-harfbuzz \
    --with-imagemagick \
    --with-rsvg \                    # SVG support (very useful)
    --with-webp \                    # WebP image support
    --with-sqlite3 \                 # New in recent Emacs, good for packages
    CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer -fno-plt"

# ================== BUILD ==================

echo "=== Starting bootstrap (this takes time) ==="
make bootstrap -j"$JOBS"

echo "=== Building Emacs ==="
make -j"$JOBS"

# ================== INSTALL ==================
sudo make install

echo "=== Emacs 30.2 successfully installed to $PREFIX ==="
echo "You can run it with: $PREFIX/bin/emacs"

