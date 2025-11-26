# SBCL

on linux 64 bit , binary install
```
INSTALL_ROOT=/opt/sbcl sh make.sh --fancy
```

on linux 64 bit , build from source -  this should suffice

```
# since already have sbcl at /opt/sbcl/bin/sbcl , like to keep it there if it fails

# we have 32gb installed just let dynamic space go balls to the wall 
sh make.sh --prefix=/opt/sbcl-2.5.10 --dynamic-space-size=32Gb --fancy

# regress tests
cd ./tests && sh run-tests.sh

# documentation
cd ./doc/manual && make


```
sh make.sh --prefix=/opt/sbcl-2.5.10 --dynamic-space-size=32Gb --fancy
