
;; ========================================
;;  Package Management
;; ========================================
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
;;==============================================
;; manually install
;; projectile
;; treemacs ?
;; flycheck 
;;==============================================


;;==============================================
;;
;;==============================================
;; we want autosaves
(setq make-backup-files t)

;; two dired buffers - C means copy ?!?
;; (setq dired-dwim-target t)

;; --- so we can edit this as soon as emacs starts
(defun my/init-file ()
  (interactive)
  (find-file "/home/terry/.emacs.d/init.el"))
(global-set-key  (kbd "<f5>") #'my/init-file)
;;(global-set-key  (kbd "<f6>") (lambda () (interactive) (find-file "~/src/emacs/ob-sml/ob-sml.el")))

(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq line-number-mode t)
(setq column-number-mode t)
;; maximum frame size but not full screen
(set-frame-parameter nil 'fullscreen 'fullboth)

(set-foreground-color "black")
(set-background-color "white")

;; (set-foreground-color "white")
;; (set-background-color "black")
;;(load-theme 'deeper-blue)
;;(load-theme 'modus-vivendi)
;;(load-theme 'modus-operandi-deuteranopia)
;;(load-theme 'wombat)
;;(load-theme 'tango-dark)
;;(load-theme 'leuven-dark)

;;(set-face-attribute 'default nil :height 105)
;;(set-default-font "Inconsolata 12")
;;(set-frame-font "DejaVu Sans Mono-14" nil t)
;;(set-frame-font "monaco 12" nil t)
(set-frame-font "firacode 11" nil t)
;; (set-frame-font "firacode retina 12" nil t)
;; xlsfonts

;;(set-frame-font "9x15" nil t)
;;(set-frame-font "10x20" nil t)
;;(set-frame-font "menlo 10" nil t)




;; ========================================
;;  Core UI / Quality of Life
;; ========================================
(use-package which-key
  :config (which-key-mode))

(use-package company
  :config
  (global-company-mode 1)
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.1))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package projectile
  :init (projectile-mode +1))

(use-package magit)

;; ========================================
;;  Haskell Core
;; ========================================
;; (defun haskell-mode-hook-setup ()
;;   "Setup haskell-mode for the current buffer."
;;   (when (and (bound-and-true-p haskell-mode)
;;              (not (haskell-process-is-running)))
;;     ;; Start the process if not running
;;     (haskell-process-start)
;;     ;; Use 'haskell-process-ensure' to wait for the process to be ready
;;     ;; before loading the file. This prevents race conditions.
;;     (haskell-process-ensure (lambda () (haskell-process-load-file)))))
;;:hook	 (haskell-mode . haskell-mode-hook-setup)

;; (defun my/debug-key (char)
;;   "Print the function bound to CHAR in haskell-mode-map to minibuffer.
;; CHAR should be a character like ?l, ?z, ?c, ?t, or ?r.
;; Example: (my/debug-haskell-key ?l) -> \"You activated haskell mode map function l: haskell-process-load-or-reload\""
;;   (interactive "c") ; Prompts for a character
;;   (let* ((key (vector char))
;;          (func (lookup-key haskell-mode-map key)))
;;     (if func
;;         (message "You activated haskell mode map function %c: %s" char func)
;;       (message "You activated haskell mode map function %c: (No binding found)" char))))

;;(lookup-key haskell-mode-map (kbd "C-c C-l"))
;; (lookup-key haskell-mode-map (vector ?z))
;; (lookup-key haskell-mode-map (vector ?r)) 
;; Looks up the key 'z' in the map

(use-package haskell-mode
  :mode ("\\.hs\\'" . haskell-mode)
  :hook ((haskell-mode . haskell-indentation-mode)
	  ;; ADD THIS LINE: Disable flycheck for Haskell
         (haskell-mode . flycheck-mode-off)
	 ;; ENSURE syntax highlighting is explicitly enabled
         (haskell-mode . (lambda () (font-lock-mode 1)))
	 ;; ENSURE we do not use interactive-haskell-mode !! how ??
	 ;; (haskell-mode . interactive-haskell-mode)
	 )
  :config
  ;; Critical: Use Stack for everything
  (setq haskell-process-type 'stack-ghci
        haskell-process-args-stack-ghci '("--ghci-options" "-ferror-spans")
        haskell-stylish-on-save t)
  ;; Hook into haskell-mode to run after interactive-haskell-mode
  (add-hook 'haskell-mode-hook #'my/haskell-custom-bindings)
  )


;; Define the function to apply custom bindings
(defun my/haskell-custom-bindings ()
  "Apply custom bindings after interactive-haskell-mode finishes."
  ;; Only run if we are in a Haskell buffer
  (when (eq major-mode 'haskell-mode)
    (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload)
    (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
    (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
    (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
    (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
    (message "Haskell custom bindings applied successfully"))
  )



  ;; :bind (:map haskell-mode-map
  ;;             ("C-c C-l" . my/debug-key) ;;haskell-process-load-or-reload)
  ;;             ("C-c C-z" . my/debug-key) ;; haskell-interactive-switch)
  ;;             ("C-c C-c" . my/debug-key) ;;haskell-compile)
  ;;             ("C-c C-t" . my/debug-key);;haskell-mode-show-type-at)
  ;;             ("C-c C-r" . my/debug-key);;haskell-process-load-or-reload)))
  ;; 	      )


;; (defun my/haskell-process-load-or-reload ()
;;   (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload))

;; ;; Rebind C-c C-r to this new function
;; (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload)

;; ;; Rebind C-c C-r to this new function
;; (define-key haskell-mode-map (kbd "C-c C-r") 'my/haskell-process-reload-same)


;; ========================================
;;  LSP Mode (replacing Eglot)
;; ========================================
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")   ; Very useful prefix
  :hook (haskell-mode . lsp-deferred)  ; Start LSP when opening Haskell file
  :config
  ;; Important settings for Stack + HLS
  (setq lsp-response-timeout 120
        lsp-connect-timeout 120
        lsp-idle-delay 0.5)

  ;; Use the wrapper (best for Stack)
  (setq lsp-haskell-server-wrapper "haskell-language-server-wrapper")

  ;; Project root detection (Stack-friendly)
  (setq lsp-auto-guess-root t)

  ;; Performance
  (setq lsp-log-io nil)  ; Set to t only when debugging
  (setq gc-cons-threshold 100000000
        read-process-output-max (* 1024 1024)))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-doc-enable t
        lsp-ui-peek-enable t))

(use-package lsp-haskell  :ensure t)

;; In your init.el or config package manager
(use-package treemacs
  :ensure t
  :config
  (setq treemacs-is-never-other-window t) ;; Don't jump windows when opening
  (setq treemacs-no-png-images t) ;; Use icons if you have all-the-icons installed
  (treemacs-follow-mode 1) ;; Auto-scroll to current file
  (treemacs-filewatch-mode 1)) ;; Watch for external changes


(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t
  )

(use-package company
  :ensure t
  :init
  (global-company-mode 1)
  :config
  (setq company-idle-delay 0.1) ;; Faster popup
  (setq company-minimum-prefix-length 1)) ;; Show after 1 char

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  ;; Customize the colors
  )


(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 0.5)) ;; Show after 0.5 seconds of inactivity


;; ;; 1. The "Pinky Saver" - Leader Key (Space)
;; ;; 1. Load general.el
;; (use-package general
;;   :ensure t
;;   :config
;;   ;; Initialize the leader key
;;   (general-create-definer leo-leader
;;     :prefix "SPC"           ;; The leader key
;;     :states 'normal         ;; If using evil-mode; remove if not
;;     :global-prefix "C-c")  ;; Optional: global prefix if you want C-c as backup

;;   ;; 2. Define your keybindings
;;   (leo-leader
;;    "t" 'treemacs-toggle      ;; SPC t toggles the tree
;;    "f" 'find-file            ;; SPC f finds a file
;;    "s" 'save-buffer          ;; SPC s saves the buffer
;;    "r" 'revert-buffer        ;; SPC r reloads the buffer
;;    "q" 'kill-current-buffer  ;; SPC q kills current buffer
;;    "e" 'eval-expression)     ;; SPC e evaluates expression

;;   ;; Optional: Global bindings (outside the leader)
;;   (general-def
;;     :keymaps 'global
;;     "C-j" 'next-line         ;; Example: remap C-j to next-line
;;     "C-k" 'previous-line))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-box dune eat flycheck general haskell-mode ivy lsp-haskell
		 lsp-ui magit neocaml ocaml-eglot opam-switch-mode
		 projectile treemacs treemacs-projectile tuareg utop
		 vertico vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
