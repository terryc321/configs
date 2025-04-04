#!/bin/bash

# halt on error by set -e
set -e

# git clone git@github.com:emacs-mirror/emacs.git --level 1


# enter source directory
cd emacs

# ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
# configure package as would with stumpwm
./autogen.sh

./configure \
  --prefix=/opt/emacs
  --without-compress-install \
  --with-native-compilation \
  --with-tree-sitter \
  --with-json \
  --with-mailutils \
  --with-cairo \
  --with-harfbuzz \
  --with-imagemagick \
  CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"

# make
make 


# make tmp build directory
BUILDDIR=/tmp/emacs/build

# trash stumpwm build directory if it exists
rm -rf $BUILDDIR

# create build directory
mkdir -pv $BUILDDIR

# install into the builddir 
make install DESTDIR=$BUILDDIR

# strip libraries
strip -s $BUILDDIR/usr/lib/* $BUILDDIR/usr/bin/*

# gzip any man pages
gzip -9 /tmp/build/usr/man/man?/*.?


# make the install directory
cd $BUILDDIR
mkdir -pv install

cd install

# create actual package

# makepkg app-version-arch-tag.tgz
# version : 30.1
# arch x86_64
# tag 1

APP='emacs'

VERSION='30.1'

# arch 64 bit x86
ARCH='x86_64'

# tag 1 first
TAG='1'

makepkg ../$APP-$VERSION-$ARCH-$TAG.tgz

# and install it
installpkg ../$APP-$VERSION-$ARCH-$TAG.tgz





