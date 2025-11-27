#!/bin/bash

make bootstrap-racket

# make install step
IDRIS2_CG=racket make install

# install idris2 library documentation
make install-libdocs

"${BROWSER:-echo}" "$(idris2 --libdir)"/docs/index.html
##/home/terry/.idris2/idris2-0.8.0/docs/index.html

#run tests
make test

#make install-api

# shell bash completion
#eval "$(idris2 --bash-completion-script idris2)

