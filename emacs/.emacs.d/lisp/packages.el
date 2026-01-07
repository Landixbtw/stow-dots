 ;;; packages.el --- Package declarations -*- lexical-binding: t; -*-

;; Themes
;; tsoding

(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; (use-package temple-os-theme
;;   :straight
;;   (:host github :repo "Senka07/temple-os-emacs-theme")
;;   :config
;;   (load-theme 'temple-os t))
;; (custom-set-variables)

;; helpful used to be here, but I did not really use it

(use-package magit
  :bind(("C-c m s" . magit-status)
	("C-c m l" . magit-log))
  :config
  (setq magit-auto-revert-mode nil))

(use-package hl-todo
  :ensure t
  :hook ((prog-mode . hl-todo-mode)
	 (yaml-ts-mode . hl-todo-mode))
  :config
  (setq hl-todo-keyword-faces
	'(("TODO"   . "#ffff00")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB"   . "#1E90FF")

          ("NOTE"   . "#008000")
          ("PERF"   . "#A020F0"))))

(use-package magit-todos
  :ensure t
  :after magit
  :config
  (magit-todos-mode 1)
  (setq magit-todos-keywords (mapcar #'car hl-todo-keyword-faces)))


;; completion for emacs, not for code
(use-package vertico
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :config
  (vertico-mode))

;; add explanations to ie M-x eval-buffer
(use-package marginalia
  :config(marginalia-mode))

(use-package company
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 1)
  :config
  (global-company-mode))

(use-package which-key
  :config
  (setq which-key-idle-delay 0.2)
  (which-key-mode))

;; this is suposedly more modern then flymake, which is built-in to emacs
(use-package flycheck
  :config
  (global-flycheck-mode))

;; I dont think I have ever used vterm, do I need it?

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; extras for dired

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; colorfull dired
(use-package diredfl
  :config
  (diredfl-global-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; LSP eglot, is apparently standard and better
(setq read-process-output-max (* 1024 1024))

(use-package eglot
  :ensure t
  :hook
  ;; Hooks to automatically start Eglot for these major modes
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure))
  :config
  ;; Tell Eglot to use 'clangd' for C and C++ buffers
  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode) . ("clangd" "--header-insertion=never --clang-tidy --background-index"))))


;; --- Eglot for Java ---
;; This uses the recommended 'eglot-java' package to manage the complex JDTLS server
(use-package eglot-java
  :ensure t
  :hook (java-mode . eglot-java-mode))

(use-package project
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;

;; org mode and bibtex

(use-package ivy-bibtex
  :after org
  :custom
  (bibtex-completion-bibliography
        '("~/ref.bib"))
  (bibtex-completion-library-path '("~/papers"))
  (bibtex-completion-cite-prompt-for-optional-arguments nil)
  (bibtex-completion-cite-default-as-initial-input t)
  )

(use-package org-ref
:custom
(org-ref-default-bibliography "~/ref.bib")
(org-ref-pdf-directory "~/papers")
(org-ref-completion-library 'org-ref-ivy-cite)
:config
(require 'org-ref-wos)
(require 'doi-utils)
)

;; nicer writing env ie for LaTeX
(use-package olivetti
    :diminish
    :hook (text-mode . olivetti-mode)
    :config
    (setq olivetti-body-width 120)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; all hooks for the packages
(add-hook 'prog-mode-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'global-flycheck-mode)
(add-hook 'prog-mode-hook 'global-font-lock-mode)

;; help with context and commands
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))


(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings )) ;; alternative for 'describe-bindings'

  :init
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
  
  :config
  ;; Hide the mode line of the Embark live/completions buffers
    (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package mu4e
  :ensure nil
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  (setq user-mail-address "owmlea@gmail.com")
  (setq user-full-name  "Ole Wortmann")

  
  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
  (setq mu4e-refile-folder "/[Gmail]/All Mail")
  (setq mu4e-trash-folder  "/[Gmail]/Trash")

(setq mu4e-maildir-shortcuts
    '((:maildir "/Inbox"    :key ?i)
      (:maildir "/[Gmail]/Sent Mail" :key ?s)
      (:maildir "/[Gmail]/Trash"     :key ?t)
      (:maildir "/[Gmail]/Drafts"    :key ?d)
      (:maildir "/[Gmail]/All Mail"  :key ?a))))

(provide 'packages)

