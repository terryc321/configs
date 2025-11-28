
;;https://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; --- so we can edit this as soon as emacs starts 
(defun my/init-file ()
  (interactive)
  (find-file "/home/terry/.emacs.d/init.el"))
(global-set-key  (kbd "<f5>") #'my/init-file)
;;(global-set-key  (kbd "<f6>") (lambda () (interactive) (find-file "~/src/emacs/ob-sml/ob-sml.el")))

(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

;; (set-foreground-color "white")
;; (set-background-color "black")
;;(load-theme 'deeper-blue)
(load-theme 'modus-operandi-deuteranopia)
;;(load-theme 'wombat)
;; (load-theme 'tango-dark)
;;(load-theme 'leuven-dark)

;;(set-face-attribute 'default nil :height 105)
;;(set-default-font "Inconsolata 12")
;;(set-frame-font "DejaVu Sans Mono-14" nil t)
;;(set-frame-font "monaco 12" nil t)
;;(set-frame-font "firacode 12" nil t)
(set-frame-font "menlo 12" nil t)

;; (defun install-all-theme-packages ()
;;   "Mark all available packages ending in '-theme' for installation and execute."
;;   (interactive)
;;   ;; Ensure package archives are refreshed
;;   (unless package-archive-contents
;;     (package-refresh-contents))
  
;;   (let* ((all-packages package-archive-contents)
;;          (theme-packages (cl-loop for archive in all-packages
;;                                   append (cl-loop for package-desc in (cdr archive)
;;                                                   when (string-match-p "-theme$" (symbol-name (car package-desc)))
;;                                                   collect (car package-desc)))))
;;     (if theme-packages
;;         (progn
;;           (dolist (pkg theme-packages)
;;             (unless (package-installed-p pkg)
;;               (package-install pkg)))
;;           (message "Initiated installation for all -theme packages."))
;;       (message "No packages ending in '-theme' found."))))


;; (let* ((all-packages package-archive-contents))
;;   (cl-loop for archive in all-packages
;;            append (cl-loop for package-desc in archive
;;                            when (string-match-p "-theme$"
;; 						(symbol-name (car package-desc)))
;;                            collect (car package-desc))))
  
;; (car package-archive-contents)

;; (require 'cycle-themes)
;; (setq cycle-themes-theme-list '(leuven monokai solarized-dark))
;; ; Example themes
;; (cycle-themes-define-list '("modus-operandi" "modus-vivendi" "adwaita" "doom-one")) 
;; (global-set-key (kbd "C-c C-t") 'cycle-themes)

;;(set-face-attribute "DejaVu Sans Mono-14" nil :height 105)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-frame-parameter nil 'fullscreen 'fullboth)

;; suppress warnings
(add-to-list 'warning-suppress-types '(emacs))
(setq native-comp-async-report-warnings-errors 'silent)

;;
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq warning-minimum-level :error)

(use-package tuareg
  :ensure t)

(use-package eglot
  :ensure t)

;; no ocaml eglot ??
(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure))


;; ============= guile geiser =======================
;; pick up my info ??
(add-to-list 'load-path "~/src/geiser/geiser/")
(add-to-list 'load-path "~/src/geiser/geiser-chicken/")


(use-package geiser  :ensure t)
(use-package geiser-stklos  :ensure t)
;; (use-package geiser-mit  :ensure t)

(use-package slime  :ensure t)


;; stop geiser opening the project root git directory
(setq geiser-repl-current-project-function #'ignore)

;; ;; scheme mode hook
;; (add-hook 'scheme-mode-hook 'company-mode)
;; (add-hook 'scheme-mode-hook 'company-box-mode)

;; (add-hook 'geiser-hook 'company-mode)
;; (add-hook 'geiser-hook 'company-box-mode)

(add-hook 'dired-hook (ivy-mode -1))

;; (setq geiser-racket-binary "/usr/bin/racket")
;; (setq geiser-chicken-binary "/opt/stklos/bin/stklos")
;; (setq geiser-chicken-binary "/opt/chicken-5.4.0/bin/csi")
(setq geiser-guile-binary "/opt/guile/bin/guile")

(setq geiser-active-implementations '(guile))
;;(setq geiser-active-implementations '(guile chicken))
;; (setq geiser-active-implementations '(guile chicken stklos))
;; (setq geiser-active-implementations '(stklos))
;; (setq geiser-active-implementations '(racket))
;; ===================================================

;; infinite ansi term scrollback
(setq term-buffer-maximum-size nil)

;; yank is same in terminal
(define-key term-mode-map (kbd "C-c C-y") 'term-paste)

;; (require 'ansi-color)
;; (add-hook 'term-mode-hook
;;           (lambda ()
;;             (ansi-color-for-comint-mode-on)))
;; (setq system-uses-terminfo nil)

