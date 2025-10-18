
https://www.linuxfromscratch.org/blfs/view/svn/general/guile.html


sudo apt install libunistring-dev


======== normal user ================

CC="gcc -std=gnu17"          \
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/guile-3.0.10 &&
make      &&
make html &&

makeinfo --plaintext -o doc/r5rs/r5rs.txt doc/r5rs/r5rs.texi &&
makeinfo --plaintext -o doc/ref/guile.txt doc/ref/guile.texi

======== root user =========

make install      &&
make install-html &&

mkdir -p                       /usr/share/gdb/auto-load/usr/lib &&
mv /usr/lib/libguile-*-gdb.scm /usr/share/gdb/auto-load/usr/lib &&
mv /usr/share/doc/guile-3.0.10/{guile.html,ref} &&
mv /usr/share/doc/guile-3.0.10/r5rs{.html,}     &&

find examples -name "Makefile*" -delete         &&
cp -vR examples   /usr/share/doc/guile-3.0.10   &&

for DIRNAME in r5rs ref; do
  install -v -m644  doc/${DIRNAME}/*.txt \
                    /usr/share/doc/guile-3.0.10/${DIRNAME}
done &&
unset DIRNAME


