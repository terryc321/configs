
# emacs 

https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation

## prior dependencies

as root install necessary libraries

```
#!/bin/bash

apt install libacl1
apt install libasound2
apt install libc6
apt install libcairo2
apt install libdbus
apt install libfontconfig1
apt install libfreetype6
apt install libgccjit0
apt install libgdk
apt install libgif7
apt install libglib2
apt install libgmp10
apt install libgnutls30
apt install libgpm2
apt install libgtk
apt install libharfbuzz0b
apt install libice6
apt install libjansson4
apt install libjpeg62
apt install liblcms2
apt install libm17n
apt install libotf1
apt install libpango
apt install libpng16
apt install librsvg2-2
apt install libselinux1
apt install libsm6libsystemd0
apt install libtiff6
apt install libtinfo6
apt install libx11
apt install libxext6libxfixes3
apt install libxml2
apt install libxrender1
apt install zlib1g

apt install libacl1-dev
apt install libasound2-dev
apt install libc6-dev
apt install libcairo2-dev
apt install libdbus-dev
apt install libfontconfig1-dev
apt install libfreetype6-dev
apt install libgccjit0-dev
apt install libgdk-dev
apt install libgif7-dev
apt install libglib2-dev
apt install libgmp10-dev
apt install libgnutls30-dev
apt install libgpm2-dev
apt install libgtk-dev
apt install libharfbuzz0b-dev
apt install libice6-dev
apt install libjansson4-dev
apt install libjpeg62-dev
apt install liblcms2-dev
apt install libm17n-dev
apt install libotf1-dev
apt install libpango-dev
apt install libpng16-dev
apt install librsvg2-dev
apt install libselinux1-dev
apt install libsm6libsystemd0-dev
apt install libtiff6-dev
apt install libtinfo6-dev
apt install libx11-dev
apt install libxext6libxfixes3-dev
apt install libxml2-dev
apt install libxrender1-dev
apt install zlib1g-dev

# 
apt install libxaw7 libxaw7-dev
apt install libtree-sitter-dev
apt install gnutls-dev
apt install libgif-dev libgif7 libungif-bin
apt install libxaw3dxft-dev
apt install libmagickwand-dev

# same version as gcc installed
apt install libgccjit-13-dev

apt install libgpm-dev

# wxgtk - this is not needed for emacs?
apt install libwxgtk3.2-dev 

# gtk 
apt install libgtk-3-dev

# installs the world !
apt install libwebkitgtk-6.0-dev
apt install libwebkit2gtk-4.1-dev

apt install libqt5webkit5-dev   

```

# the source code

```
git clone git@github.com:emacs-mirror/emacs.git
cd emacs 
./autogen.sh
```

# mybuild script

```
./configure \
  --prefix=/opt/emacs \
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
```

# capture build messages both error and normal 
```
./mybuild.sh 2>&1 | tee mybuild.log 
```


# compile

```
make -j8 2>&1 | tee mybuild.compilation.log 
```


# install

```
sudo make install
```