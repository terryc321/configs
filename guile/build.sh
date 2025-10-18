

git clone --branch 'main' --single-branch --depth 1 https://git.savannah.gnu.org/git/guile.git

cd guile


Required External Packages ================================================

Guile requires the following external packages:

  - GNU MP, at least version 4.2

    GNU MP is used for bignum arithmetic.  It is available from
    http://gmplib.org/ .

  - libltdl from GNU Libtool, at least version 1.5.6

    libltdl is used for loading extensions at run-time.  It is
    available from http://www.gnu.org/software/libtool/ .

  - GNU libunistring, at least version 0.9.3

    libunistring is used for Unicode string operations, such as the
    `utf*->string' procedures.  It is available from
    http://www.gnu.org/software/libunistring/ .

  - libgc, at least version 7.2

    libgc (aka. the Boehm-Demers-Weiser garbage collector) is the
    conservative garbage collector used by Guile.  It is available
    from http://www.hboehm.info/gc/ .

  - libffi

    libffi provides a "foreign function interface", used by the
    `(system foreign)' module.  It is available from
    http://sourceware.org/libffi/ .

  - pkg-config

    Guile's ./configure script uses pkg-config to discover the correct
    compile and link options for libgc and libffi.  For this to work,
    the `PKG_CONFIG_PATH' environment variable must be set to point to
    the places where libgc's and libffi's `.pc' files can be found:

      PKG_CONFIG_PATH=/path/to/libgc/lib/pkgconfig:/path/to/libffi/lib/pkgconfig

    Alternatively, when pkg-config is not installed, you can work around
    this by setting some variables as part of the configure
    command-line:

    - PKG_CONFIG=true

    - BDW_GC_CFLAGS=<compile flags for picking up libgc headers>

    - BDW_GC_LIBS=<linker flags for picking up the libgc library>

    Note that because you're bypassing all pkg-config checks, you will
    also have to specify libffi flags as well:

    - LIBFFI_CFLAGS=<compile flags for picking up libffi headers>

    - LIBFFI_LIBS=<linker flags for picking up the libffi library>


When building from a Git checkout, these additional packages are needed:

  - GNU Autoconf
  - GNU Automake
  - GNU Libtool
  - GNU Autopoint
  - Flex
  - GNU Gettext
  - GNU Texinfo
  - GNU Gperf

If you use GNU Guix, you can obtain a shell for development with all the
dependencies by running the following command from the top directory of
the checkout:

  guix shell

You can also build Guile by running:

  guix build -f guix.scm

######################################################
how do i generate a configure file ?
  
  autoreconf --verbose --install --force

./configure --prefix=/opt/guile  
make
make html
make doc

sudo make install
sudo make install-html

########################################################


  

# https://www.linuxfromscratch.org/blfs/view/svn/general/guile.html


# sudo apt install libunistring-dev


# ======== normal user ================

# CC="gcc -std=gnu17"          \
# ./configure --prefix=/usr    \
#             --disable-static \
#             --docdir=/usr/share/doc/guile-3.0.10 &&
# make      &&
# make html &&

# makeinfo --plaintext -o doc/r5rs/r5rs.txt doc/r5rs/r5rs.texi &&
# makeinfo --plaintext -o doc/ref/guile.txt doc/ref/guile.texi

# ======== root user =========

# make install      &&
# make install-html &&

# mkdir -p                       /usr/share/gdb/auto-load/usr/lib &&
# mv /usr/lib/libguile-*-gdb.scm /usr/share/gdb/auto-load/usr/lib &&
# mv /usr/share/doc/guile-3.0.10/{guile.html,ref} &&
# mv /usr/share/doc/guile-3.0.10/r5rs{.html,}     &&

# find examples -name "Makefile*" -delete         &&
# cp -vR examples   /usr/share/doc/guile-3.0.10   &&

# for DIRNAME in r5rs ref; do
#   install -v -m644  doc/${DIRNAME}/*.txt \
#                     /usr/share/doc/guile-3.0.10/${DIRNAME}
# done &&
# unset DIRNAME


