;;; packages.el --- Package Declarations & Basic Config -*- lexical-binding: t; -*-

;; 1. Global Installation Settings
(setq straight-use-package-by-default t)

;; ============================================================
;;  GIT & PROJECT MANAGEMENT
;; ============================================================
(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log))
  :config
  (setq magit-auto-revert-mode nil))

(use-package magit-todos
  :after magit
  :config
  (magit-todos-mode 1))

;; Restored your custom colors for TODOs
(use-package hl-todo
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

(use-package project)


;; ============================================================
;;  MINIBUFFER & COMPLETION (Vertico Stack)
;; ============================================================
(use-package vertico
  :init (vertico-mode)
  :custom
  (vertico-cycle t))

(use-package marginalia
  :init (marginalia-mode))

(use-package embark
  :bind ("C-." . embark-act)
  :config
  ;; Restored your embark display rules
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package company
  :hook (prog-mode . company-mode)
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 1))

(use-package which-key
  :init (which-key-mode))


;; ============================================================
;;  PROGRAMMING, LSP & COMPILERS
;; ============================================================
(use-package flycheck
  :init (global-flycheck-mode))

(use-package flycheck-eglot
  :after (flycheck eglot)
  :config (global-flycheck-eglot-mode 1))

;; Restored your Clangd and Java settings
(use-package eglot
  :hook ((c-mode c++-mode java-mode LaTeX-mode) . eglot-ensure)
  :config
  (setq read-process-output-max (* 1024 1024))
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '((c++-mode c-mode) . ("clangd" "--header-insertion=never" "--clang-tidy" "--background-index")))))

(use-package eglot-java
  :hook (java-mode . eglot-java-mode))


;; ============================================================
;;  UI & APPEARANCE
;; ============================================================
(use-package all-the-icons :if (display-graphic-p))
(use-package all-the-icons-dired :hook (dired-mode . all-the-icons-dired-mode))
(use-package diredfl :init (diredfl-global-mode))

(use-package olivetti
  :hook (text-mode . olivetti-mode)
  :config
  (setq olivetti-body-width 120))


;; ============================================================
;;  ORG MODE MANIFEST (Config is in org.el)
;; ============================================================

;; 1. Core Org (Built-in)
(use-package org :straight (:type built-in))

;; 2. The Ecosystem (Just install them here)
(use-package org-roam)
(use-package cdlatex)
(use-package org-fragtog)
(use-package org-download)
(use-package org-modern)

;; 3. Citations
(use-package citar)
(use-package citar-embark :after citar embark)

(provide 'packages)
;;; packages.el ends here
