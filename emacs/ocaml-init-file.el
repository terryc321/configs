;; ---- firstly install the ocaml toolchain -- otherwise rest of this may not make sense 
;; # update opam
;; opam update
;; opam upgrade 
;;
;; # Install the essentials
;; opam install ocaml-lsp-server ocamlformat dune utop
;;
;; # Optional but very useful
;; opam install ocp-indent
;;
;; # ocaml suggests 
;; opam user-setup install
;;
;;; OCaml Configuration
;;
;; 1. Package setup (add MELPA if not already there)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ====================================================
;;
;; =====================================================
;; infinite scrollback on ansi-term - according to chatgpt
(setq term-buffer-maximum-size nil)

;; yank into ansi term !
(define-key term-mode-map (kbd "C-c C-y") 'term-paste)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)         ; hide welcome screen
(setq inhibit-startup-screen t)

(setq make-backup-files t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(set-frame-font "Inconsolata-12" nil t)
(set-frame-font "FiraCode-12" nil t)
;;(set-frame-font "FiraCode-10" nil t)

(defun my/init-file ()
  (interactive)
  (find-file "/home/terry/.emacs.d/init.el"))
(global-set-key  (kbd "<f5>") #'my/init-file)
(defun my/config-file ()
  (interactive)
  (find-file "/home/terry/code/configs/emacs/ocaml-init-file.el"))
(global-set-key (kbd "<f6>") #'my/config-file)



;; 2. Core OCaml packages
;;; Modern OCaml Setup with neocaml + dune utop (2026)


;; === Tree-sitter OCaml mode ===
(use-package neocaml
  :mode (("\\.ml\\'"  . neocaml-mode)
         ("\\.mli\\'" . neocaml-mode)
         ("\\.mll\\'" . neocaml-mode)
         ("\\.mly\\'" . neocaml-mode))
  :config
  (setq neocaml-indent-basic 2))

;; === Dune support ===
(use-package dune
  :mode (("\\.dune\\'" . dune-mode)
         ("dune-project\\'" . dune-mode)
         ("dune-workspace\\'" . dune-mode)))

;; === LSP (ocaml-eglot) ===
(use-package ocaml-eglot
  :after neocaml
  :hook
  (neocaml-base-mode . ocaml-eglot-mode)
  (ocaml-eglot-mode . eglot-ensure)
  (ocaml-eglot-mode . (lambda ()
                        (add-hook 'before-save-hook #'eglot-format nil t)))
  :config
  (setq ocaml-eglot-syntax-checker 'flymake))

;; === Utop + dune utop integration ===
(use-package utop
  :hook (neocaml-mode . utop-minor-mode)
  :config
  ;; This is the key line for dune utop
  (setq utop-command "opam exec -- dune utop . -- -emacs")

  ;; Optional: nicer behavior
  (setq utop-skip-after-eval-phrase nil))

;; === Other useful packages ===
(use-package opam-switch-mode
  :hook (neocaml-mode . opam-switch-mode))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.2))

(use-package compile
  :config
  (setq compile-command "dune build")
  (defun my-ocaml-compile-command ()
    (setq-local compile-command
                (if (locate-dominating-file default-directory "dune-project")
                    "dune build"
                    "dune build")))
  :hook (neocaml-mode . my-ocaml-compile-command))

;; === Keybindings ===
(with-eval-after-load 'utop
  (define-key utop-mode-map (kbd "C-<up>") 'utop-history-goto-prev)
  (define-key utop-mode-map (kbd "C-<down>") 'utop-history-goto-next))

(with-eval-after-load 'neocaml
  (define-key neocaml-mode-map (kbd "C-c C-r") 'utop-eval-region)     ; or recompile
  (define-key neocaml-mode-map (kbd "C-c C-c") 'dune-build)     ; or recompile
  (define-key neocaml-mode-map (kbd "C-c C-z") 'utop))          ; open utop

;; General settings
(show-paren-mode 1)
(electric-pair-mode 1)
(setq-default indent-tabs-mode nil)
