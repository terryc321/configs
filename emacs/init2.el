
<<<<<<< HEAD
;; a default config to be placed at ~/.emacs.d/init.el


(set-background-color "black")
(set-foreground-color "green")

(setq inhibit-startup-screen t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
=======
;; ========= MELPA ==========
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
;; ==== END MELPA ==================



;; ======= SLIME ===============
(add-to-list 'load-path "~/src/slime")
(require 'slime-autoloads)

;; Set your lisp system and some contribs
(setq inferior-lisp-program "/opt/sbcl-2.5.1/bin/sbcl")
(setq slime-contribs '(slime-scratch slime-editing-commands))
;; ======= END SLIME ===============

>>>>>>> b07ea5ee0d660cf59fe0a0e393c54b027804e948

