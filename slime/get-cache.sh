#!/bin/bash

# get latest cache
# lot of old hidden directories squirrelled buried away like chestnuts
find / | grep sbcl | grep -E '2.5.9' > cache.txt

#rm -rf /home/terry/.slime
#rm -rf /home/terry/.cache/common-lisp/sbcl-2.5.9-linux-x64
#rm -rf /home/terry/.cache/common-lisp/sbcl-2.2.9.debian-linux-x64
#rm -rf /home/terry/src/sbcl-build/sbcl-2.5.9

# guix 
