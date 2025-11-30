;;; packages.el --- Package declarations -*- lexical-binding: t; -*-

;; Theme
(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; Evil mode
;; (use-package evil
;;   :init
;;   (setq evil-want-integration t)
;;   (setq evil-want-keybinding nil)
;;   :config
;;   (evil-mode 1))

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; Helpful
(use-package helpful
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-c C-d" . helpful-at-point)
         ("C-h F" . helpful-function)
         ("C-h C" . helpful-command)))

;; Magit
(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log))
  :config
  (setq magit-auto-revert-mode nil))

;; Completion
(use-package vertico
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :config
  (vertico-mode))

(use-package marginalia
  :config (marginalia-mode))

(use-package company
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 1)
  :config
  (global-company-mode))

;; Snippets
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; LSP & Tools
(use-package which-key
  :config
  (setq which-key-idle-delay 0.3)
  (which-key-mode))

(use-package lsp-mode
  :hook ((c-mode . lsp)
         (c++-mode . lsp))
  :custom
  (lsp-idle-delay 0.1)
  :config
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package flycheck
    :straight t
  :config
  (global-flycheck-mode))

(use-package lsp-treemacs)

(use-package dap-mode
  :config
  (require 'dap-cpptools))

(use-package projectile
  :config
  (projectile-mode +1))

;; Terminal
(use-package vterm
  :custom
  (vterm-shell (executable-find "zsh"))
  (vterm-max-scrollback 10000)
  :hook (vterm-mode . (lambda () (setq-local display-line-numbers-mode nil)))
  :bind (("C-c t" . vterm)))

;; Org Mode
(use-package org-superstar
  :hook (org-mode . org-superstar-mode))

(use-package org-super-agenda
  :config (org-super-agenda-mode))

(use-package org-roam
  :custom
  (org-roam-directory "~/org")
  :config
  (org-roam-db-autosync-mode))

;; Dired extras
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package diredfl
  :config
  (diredfl-global-mode 1))

(use-package ivy-bibtex
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

(use-package olivetti
    :diminish
    :hook (text-mode . olivetti-mode)
    :config
    (setq olivetti-body-width 120)
)


(provide 'packages)
;;; packages.el ends here
