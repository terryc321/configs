
# Slime - common lisp 

```
git clone git@github.com:slime/slime.git
cd slime
make
```

https://slime.common-lisp.dev/doc/html/Installation.html#Installing-from-Git

;; inside emacs

;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
(add-to-list 'load-path "~/dir/to/cloned/slime")
(require 'slime-autoloads)

;; Set your lisp system and some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-scratch slime-editing-commands))
