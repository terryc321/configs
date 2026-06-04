
;; grok slop 
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

;;; OCaml Configuration

;; 1. Package setup (add MELPA if not already there)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; 2. Core OCaml packages
(use-package tuareg
  :mode (("\\.ml\\'" . tuareg-mode)
         ("\\.mli\\'" . tuareg-mode)
         ("\\.mlp\\'" . tuareg-mode))
  :config
  (setq tuareg-indent-align-with-first-arg t))

;; Alternative modern mode (Tree-sitter) - try this if you have Emacs 29+
;; (use-package neocaml
;;   :mode (("\\.ml\\'" . neocaml-mode)
;;          ("\\.mli\\'" . neocaml-mode)))

(use-package dune
  :mode (("\\.dune\\'" . dune-mode)
         ("dune-project\\'" . dune-mode)
         ("dune-workspace\\'" . dune-mode)))

;; 3. LSP Setup with ocaml-eglot (recommended in 2025-2026)
(use-package ocaml-eglot
  :after tuareg
  :hook
  ;; Enable ocaml-eglot minor mode when tuareg starts
  (tuareg-mode . ocaml-eglot-mode)
  ;; Start Eglot automatically
  (ocaml-eglot-mode . eglot-ensure)

  ;; Optional: Format on save with ocamlformat
  (ocaml-eglot-mode . (lambda ()
                        (add-hook 'before-save-hook #'eglot-format nil t)))

  :config
  (setq ocaml-eglot-syntax-checker 'flymake))

;; 4. Nice-to-have enhancements
(use-package flymake
  :config
  ;; Show full diagnostic messages (much better for OCaml)
  (setq flymake-diagnostic-format-alist
        '((t . (origin code message)))))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.2))

(use-package opam-switch-mode
  :hook (tuareg-mode . opam-switch-mode))

;; Optional: Better REPL integration
(use-package utop
  :hook (tuareg-mode . utop-minor-mode))

;; 5. General programming niceties
(setq-default indent-tabs-mode nil)
(show-paren-mode 1)
(electric-pair-mode 1)

;; Keybindings (optional but very useful)
(define-key tuareg-mode-map (kbd "C-c C-c") 'recompile)  ; dune build




