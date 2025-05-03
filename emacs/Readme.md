
# emacs 31.0.50

https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation

```
git clone git@github.com:emacs-mirror/emacs.git
cd emacs 
./autogen.sh
./configure \
  --prefix=/opt/emacs-31.0.50
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

  --with-xwidgets 
 could not get libwebkit to do its thing
