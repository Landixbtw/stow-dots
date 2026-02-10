;;; packages.el --- Package declarations -*- lexical-binding: t; -*-

;; --- Themes ---
;; (use-package gruber-darker-theme
;;   :config (load-theme 'gruber-darker t))

;; (use-package temple-os-theme
;;   :straight (:host github :repo "Senka07/temple-os-emacs-theme")
;;   :config (load-theme 'temple-os t))


;; --- Git / Magit ---
(use-package magit
  :bind (("C-c m s" . magit-status)
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


;; --- Completion & Minibuffer ---

;; Vertico: Better minibuffer completion
(use-package vertico
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :config
  (vertico-mode))

;; Marginalia: Rich annotations in minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Embark: Actions on targets
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
  (setq eldoc-idle-delay 1.5)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Company: Code completion
(use-package company
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 1)
  :hook (prog-mode . company-mode) ;; Hook added here instead of loosely at end
  :config
  (global-company-mode))

(use-package which-key
  :config
  (setq which-key-idle-delay 0.2)
  (which-key-mode))


;; --- LSP & Checking ---

;; Flycheck: Syntax checking UI
(use-package flycheck
  :config
  (global-flycheck-mode))

;; Bridge: Connect Eglot to Flycheck (Solves your "No Checker" issue)
(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

;; Eglot: LSP Client
(use-package eglot
  :ensure t
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure)
   (java-mode . eglot-ensure))
  :config
  (setq read-process-output-max (* 1024 1024))
  ;; FIX: Wrapped in with-eval-after-load to prevent startup errors
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '((c++-mode c-mode) . ("clangd" "--header-insertion=never" "--clang-tidy" "--background-index")))))

;; Eglot Java: Helper for JDTLS
(use-package eglot-java
  :ensure t
  :hook (java-mode . eglot-java-mode))

(use-package project
  :ensure t)


;; --- UI & Dired ---

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package diredfl
  :config
  (diredfl-global-mode))

(use-package olivetti
    :diminish
    :hook (text-mode . olivetti-mode)
    :config
    (setq olivetti-body-width 120))


;; --- Bibliography & Org ---

(use-package ivy-bibtex
  :after org
  :custom
  (bibtex-completion-bibliography '("~/ref.bib"))
  (bibtex-completion-library-path '("~/papers"))
  (bibtex-completion-cite-prompt-for-optional-arguments nil)
  (bibtex-completion-cite-default-as-initial-input t))

(use-package org-ref
  :custom
  (org-ref-default-bibliography "~/ref.bib")
  (org-ref-pdf-directory "~/papers")
  (org-ref-completion-library 'org-ref-ivy-cite)
  :config
  (require 'org-ref-wos)
  (require 'doi-utils))

(provide 'packages)
