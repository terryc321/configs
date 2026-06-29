
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
;; just use acme  theme - good balance between bright airy
;; just tweak some colors and call it good
;; 
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

;; (set-foreground-color "black")
;; (set-background-color "lightblue")
;;(load-theme 'adwaita)
;; (set-foreground-color "white")
;; (set-background-color "black")
;;(load-theme 'deeper-blue)
;;(load-theme 'modus-vivendi)
;; (load-theme 'modus-vivendi-tinted)
(load-theme 'modus-operandi-deuteranopia)
;;(load-theme 'wombat)
;;(load-theme 'tango-dark)
;;(load-theme 'leuven-dark)
;; (load-theme 'acme)


;;(set-face-attribute 'default nil :height 105)
;;(set-default-font "Inconsolata 12")
;;(set-frame-font "DejaVu Sans Mono-14" nil t)
;;(set-frame-font "monaco 12" nil t)
(set-frame-font "firacode 14" nil t)
(set-frame-font "firacode 12" nil t)
;;(set-frame-font "firacode 12" nil t)
;;(set-frame-font "firacode retina 12" nil t)
;; xlsfonts

;;(set-frame-font "9x15" nil t)
;; (set-frame-font "10x20" nil t)
;;(set-frame-font "menlo 10" nil t)

;; ===========================================================================
;;
;; ===========================================================================
(add-to-list 'load-path "~/.emacs.d/idris2-mode/")
(require 'idris2-mode)


;; ;; ============================================================================
;; ;;  Core UI / Quality of Life
;; ;;
;; ;; use-package for package-el responds to :init :demand :defer :bind :config
;; ;; using :bind will defer package loading 
;; ;; =============================================================================

;; ;; (use-package ac-geiser
;; ;;   :ensure t
;; ;;   )

;; ;; (use-package geiser
;; ;;   ;; doc - hydra - give me one key options with menu explain them 
;; ;;   ;; package.el responds to :demand :defer :bind :config :init  
;; ;;   :ensure t
;; ;;   :config
;; ;;   ;; Set the list of available implementations (e.g., guile, racket)
;; ;;   (setq geiser-active-implementations '(chicken guile stklos))
;; ;;   ;; Optional: Set a default implementation for new buffers
;; ;;   (setq geiser-default-implementation 'chicken)
;; ;;   ;; Enable Geiser mode automatically in Scheme buffers
;; ;;   (add-hook 'scheme-mode-hook 'geiser-mode)
;; ;;   (setq geiser-chicken-binary "/opt/chicken-5.4.0/bin/csi")
;; ;;   ;; (setq geiser-chicken-binary "csi")
;; ;;   ;; (setq geiser-guile-binary "guile") ; Ensure this is in your PATH
;; ;;   ;; (setq geiser-guile-load-path '("/path/to/your/modules"))
;; ;;   ;; (require 'ac-geiser)
;; ;;   ;; (add-hook 'geiser-mode-hook 'ac-geiser-setup)
;; ;;   ;; (add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
;; ;;   (setq geiser-repl-history-filename "~/.emacs.d/geiser-history")
;; ;;   )


(use-package all-the-icons
  :ensure t
  :init
  (setq all-the-icons-icon-scale 1) ;; Optional: adjust size
  :custom
  (all-the-icons-install-fonts t)) ;; This prompts to install fonts on first load


(use-package hydra
  ;; doc - hydra - give me one key options with menu explain them 
  ;; package.el responds to :demand :defer :bind :config :init
  :ensure t
  :config 
  )

(use-package posframe
  ;; doc - hydra - give me one key options with menu explain them 
  ;; package.el responds to :demand :defer :bind :config :init
  :ensure t
  :config 
  )


(use-package pretty-hydra
  ;; doc - hydra - give me one key options with menu explain them 
  ;; package.el responds to :demand :defer :bind :config :init
  :ensure t
  :config 
  )


(use-package which-key
  ;; which-key - ?
  :ensure t
  :config
  (which-key-mode)
  )

(use-package flycheck
  ;; flycheck - flymake?
  :ensure t
  :config  
  :init (global-flycheck-mode))

(use-package flycheck-posframe
  ;; 
  :ensure t
  :config 
  )

(use-package popterm
  ;; popterm -  give me one key options with menu explain them 
  :ensure t
  :config 
  )


(use-package projectile
  ;; .projectile in directory denotes a project 
  :init (projectile-mode +1)
  :ensure t
  :config  
  )

(use-package magit
  ;; git interface 
  :ensure t
  :config     
  )


(use-package company
  ;; popups 
  :ensure t
  :config 
  ;; lets not have company mode everywhere
  (global-company-mode -1)  
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.1))

(use-package company-box 
  ;; popups 
  :ensure t
  :config
  )

;; company-box ?
;; capf ?



(use-package orderless
  ;; orderless - is it like fuzzy find ?
  :ensure t
  :config
  )

(use-package vertico
  ;; vertico - minibuffer choices - into vertical column 
  :ensure t
  :config
  (vertico-mode 1)
  )

(use-package marginalia
  ;; marginalia - enhance empty space minibuffer with more info 
  :ensure t
  :config
  (marginalia-mode 1)
  )

(use-package consult
  ;; consult
  ;; useful : consult-grep 
  :ensure t
  :config
  )

(use-package embark
  ;; embark -
  ;; useful : embark-export + consult-grep
  :ensure t
  :config 
  )



;; ;; ========================================
;; ;;  Haskell Core
;; ;; ========================================
;; ;; (defun haskell-mode-hook-setup ()
;; ;;   "Setup haskell-mode for the current buffer."
;; ;;   (when (and (bound-and-true-p haskell-mode)
;; ;;              (not (haskell-process-is-running)))
;; ;;     ;; Start the process if not running
;; ;;     (haskell-process-start)
;; ;;     ;; Use 'haskell-process-ensure' to wait for the process to be ready
;; ;;     ;; before loading the file. This prevents race conditions.
;; ;;     (haskell-process-ensure (lambda () (haskell-process-load-file)))))
;; ;;:hook	 (haskell-mode . haskell-mode-hook-setup)

;; ;; (defun my/debug-key (char)
;; ;;   "Print the function bound to CHAR in haskell-mode-map to minibuffer.
;; ;; CHAR should be a character like ?l, ?z, ?c, ?t, or ?r.
;; ;; Example: (my/debug-haskell-key ?l) -> \"You activated haskell mode map function l: haskell-process-load-or-reload\""
;; ;;   (interactive "c") ; Prompts for a character
;; ;;   (let* ((key (vector char))
;; ;;          (func (lookup-key haskell-mode-map key)))
;; ;;     (if func
;; ;;         (message "You activated haskell mode map function %c: %s" char func)
;; ;;       (message "You activated haskell mode map function %c: (No binding found)" char))))

;; ;;(lookup-key haskell-mode-map (kbd "C-c C-l"))
;; ;; (lookup-key haskell-mode-map (vector ?z))
;; ;; (lookup-key haskell-mode-map (vector ?r)) 
;; ;; Looks up the key 'z' in the map

(defun my/haskell-interactive-bindings ()
  (interactive)
  "Apply custom bindings after interactive-haskell-mode finishes."
  ;; Only run if we are in a Haskell buffer
   (define-key haskell-interactive-mode-map (kbd "C-c M-o") 'haskell-interactive-mode-clear)
   )

;; (use-package haskell-mode
;;   :mode ("\\.hs\\'" . haskell-mode)
;;   :hook ((haskell-mode . haskell-indentation-mode)
;; 	  ;; ADD THIS LINE: Disable flycheck for Haskell
;;          ;;(haskell-mode . flycheck-mode-off)
;; 	 ;; ENSURE syntax highlighting is explicitly enabled
;;          ;;(haskell-mode . (lambda () (font-lock-mode 1)))
;; 	 ;; ENSURE we do not use interactive-haskell-mode !! how ??
;; 	 (haskell-mode . interactive-haskell-mode)
;; 	 (interactive-haskell-mode . my/haskell-interactive-bindings)
;; 	 )

;;   :config				
  
;; ;;   ;; ;; Critical: Use Stack for everything
;; ;;   ;; (setq haskell-process-type 'stack-ghci
;; ;;   ;;       haskell-process-args-stack-ghci '("--ghci-options" "-ferror-spans")
;; ;;   ;;       haskell-stylish-on-save t)

;; ;;   ;; Critical: Use Cabal for everything
;; ;;   (setq haskell-process-type 'cabal-repl
;; ;;       haskell-process-args-cabal-repl '("--ghci-options" "-ferror-spans")
;; ;;       haskell-stylish-on-save t)
  
;;   ;; Hook into haskell-mode to run after interactive-haskell-mode
;;   ;; (add-hook 'haskell-mode-hook #'my/haskell-custom-bindings)
;;   )



;; ;; Define the function to apply custom bindings
;; (defun my/haskell-custom-bindings ()
;;   "Apply custom bindings after interactive-haskell-mode finishes."
;;   ;; Only run if we are in a Haskell buffer
;;   (when (eq major-mode 'haskell-mode)
;;     ;; (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload)
;;     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;;     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
;;     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
;;     (message "Haskell custom bindings applied successfully"))
;;   )



;;   ;; :bind (:map haskell-mode-map
;;   ;;             ("C-c C-l" . my/debug-key) ;;haskell-process-load-or-reload)
;;   ;;             ("C-c C-z" . my/debug-key) ;; haskell-interactive-switch)
;;   ;;             ("C-c C-c" . my/debug-key) ;;haskell-compile)
;;   ;;             ("C-c C-t" . my/debug-key);;haskell-mode-show-type-at)
;;   ;;             ("C-c C-r" . my/debug-key);;haskell-process-load-or-reload)))
;;   ;; 	      )


;; ;; (defun my/haskell-process-load-or-reload ()
;; ;;   (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload))

;; ;; ;; Rebind C-c C-r to this new function
;; ;; (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload)

;; ;; ;; Rebind C-c C-r to this new function
;; ;; (define-key haskell-mode-map (kbd "C-c C-r") 'my/haskell-process-reload-same)


;; ;; ========================================
;; ;;  LSP Mode (replacing Eglot)
;; ;; ========================================
;; (use-package lsp-mode
;;   :ensure t
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")   ; Very useful prefix
;;   :hook (haskell-mode . lsp-deferred)  ; Start LSP when opening Haskell file
;;   :config
;;   ;; Important settings for Stack + HLS
;;   (setq lsp-response-timeout 120
;;         lsp-connect-timeout 120
;;         lsp-idle-delay 0.5)

;;   (setq lsp-log-io t) ;; Logs every request/response to the *lsp-log* buffer
;;   ;; (setq lsp-eldoc-enable-hover nil) ;; Optional: reduce noise
  
;;   ;; Use the wrapper (best for Stack)
;;   ;;(setq lsp-haskell-server-wrapper "haskell-language-server-wrapper")
;;   ;;(setq lsp-haskell-server-command '("stack" "exec" "--" "haskell-language-server-wrapper" "--lsp"))
;;   ;; Project root detection (Stack-friendly)
;;   (setq lsp-auto-guess-root t)

;;   ;; Performance
;;   (setq lsp-log-io nil)  ; Set to t only when debugging
;;   (setq gc-cons-threshold 100000000
;;         read-process-output-max (* 1024 1024))
;;   ;;
;;   (setq lsp-use-workspace-root-for-server-default-directory nil) 
;;   )

;; (use-package lsp-ui
;;   :ensure t
;;   :config
;;   (setq lsp-ui-sideline-enable t
;;         lsp-ui-doc-enable t
;;         lsp-ui-peek-enable t))

;; (use-package lsp-haskell
;;   :ensure t
;;   :config
;;   ;; (setq lsp-haskell-server-wrapper "haskell-language-server-wrapper")
;;   )

;; ;; In your init.el or config package manager
;; (use-package treemacs
;;   :ensure t
;;   :config
;;   (setq treemacs-is-never-other-window t) ;; Don't jump windows when opening
;;   (setq treemacs-no-png-images t) ;; Use icons if you have all-the-icons installed
;;   (treemacs-follow-mode 1) ;; Auto-scroll to current file
;;   (treemacs-filewatch-mode 1)) ;; Watch for external changes


;; (use-package treemacs-projectile
;;   :after treemacs projectile
;;   :ensure t
;;   )

;; (use-package company
;;   :ensure t
;;   :init
;;   (global-company-mode 1)
;;   :config
;;   (setq company-idle-delay 0.1) ;; Faster popup
;;   (setq company-minimum-prefix-length 1)) ;; Show after 1 char

;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   ;; Customize the colors
;;   )


;; (use-package which-key
;;   :ensure t
;;   :config
;;   (which-key-mode 1)
;;   (setq which-key-idle-delay 0.5)) ;; Show after 0.5 seconds of inactivity





;; ;; ;; 1. The "Pinky Saver" - Leader Key (Space)
;; ;; ;; 1. Load general.el
;; ;; (use-package general
;; ;;   :ensure t
;; ;;   :config
;; ;;   ;; Initialize the leader key
;; ;;   (general-create-definer leo-leader
;; ;;     :prefix "SPC"           ;; The leader key
;; ;;     :states 'normal         ;; If using evil-mode; remove if not
;; ;;     :global-prefix "C-c")  ;; Optional: global prefix if you want C-c as backup

;; ;;   ;; 2. Define your keybindings
;; ;;   (leo-leader
;; ;;    "t" 'treemacs-toggle      ;; SPC t toggles the tree
;; ;;    "f" 'find-file            ;; SPC f finds a file
;; ;;    "s" 'save-buffer          ;; SPC s saves the buffer
;; ;;    "r" 'revert-buffer        ;; SPC r reloads the buffer
;; ;;    "q" 'kill-current-buffer  ;; SPC q kills current buffer
;; ;;    "e" 'eval-expression)     ;; SPC e evaluates expression

;; ;;   ;; Optional: Global bindings (outside the leader)
;; ;;   (general-def
;; ;;     :keymaps 'global
;; ;;     "C-j" 'next-line         ;; Example: remap C-j to next-line
;; ;;     "C-k" 'previous-line))


;; (custom-set-variables
;;  '(package-selected-packages '(ac-geiser acme-theme)))
;; (custom-set-faces
;;  '(default ((t (:background nil)))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9b21c848d09ba7df8af217438797336ac99cbbbc87a08dc879e9291673a6a631"
     "85dd762a698527b9e99f73e453b4fef42948afe54d326437f51e2e03a1104936"
     "7d8d5c0eb57cb56165f253d4515e87736ec9eddb776f816616e50dab51ec30a3"
     "420745d95caebf8eb989f84dc7d1806e0eb1a09353b7868671f61149516e242d"
     "f1c8202c772d1de83eda4765fe21429a528a4fb350a28394d3705fe9678ed1f9"
     default))
 '(package-selected-packages
   '(ac-geiser acme-theme auto-dark batppuccin circadian company-box
	       dir-treeview dune eat elegant-agenda-mode
	       embark-consult evenok ewal flycheck-haskell
	       flycheck-ocaml flycheck-posframe geiser-chicken general
	       gnome-dark-style gtk-variant heaven-and-hell hyperkitty
	       idris2 idris2-mode lacquer lsp-haskell lsp-ivy lsp-ui
	       magit marginalia most-faces neocaml ns-auto-titlebar
	       nubox ocaml-eglot opam-switch-mode orderless pomo-cat
	       popterm pretty-hydra slime slime-company
	       smart-mode-line sml-basis sml-mode sml-modeline
	       sml-ts-mode smlfmt space-theming
	       spaceline-all-the-icons theme-anchor theme-buffet
	       theme-changer theme-looper theme-magic tokyo-night
	       treemacs-nerd-icons treemacs-projectile tuareg
	       use-package-hydra utop vertico vterm xmlgen)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; polyml mailing list
(use-package hyperkitty
  :ensure t
  :config
  (setq hyperkitty-mlists
	'(("polyml@lists.polyml.org" . "https://lists.polyml.org/hyperkitty")))
  (setq request-log-level 'debug)   
  (with-eval-after-load 'hyperkitty
    (defun my/hyperkitty-debug-response (orig-fun response &rest args)
  "Display raw JSON response in a buffer before processing."
  (let ((data (request-response-data response)))
    (with-current-buffer (get-buffer-create "*hyperkitty-debug-json*")
      (erase-buffer)
      (insert (json-encode data)) ;; Pretty print if possible, or raw
      (json-mode)
      (goto-char (point-min)))
    (display-buffer "*hyperkitty-debug-json*"))
  (apply orig-fun response args))

;; Apply to the function that processes the thread list
(advice-add 'hyperkitty--print-threads-table :before-until #'my/hyperkitty-debug-response)   
  (defun hyperkitty--get-response-entries-fixed (response)
    "Get entries from the paginated response or direct list.
Argument RESPONSE HTTP response to get object entries from."
    (let ((data (request-response-data response)))
      (if (listp data)
          ;; If data is already a list, return it directly
          data
        ;; Otherwise, try to get the 'results' key (standard pagination)
        (assoc-default 'results data))))

  ;; Override the original function with the fixed version
  (fset 'hyperkitty--get-response-entries #'hyperkitty--get-response-entries-fixed)))   
